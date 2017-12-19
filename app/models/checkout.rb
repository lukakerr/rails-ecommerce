class Checkout < ApplicationRecord
  belongs_to :user
  has_one :order

  before_create :set_slug

  validates :total, presence: true
  validates :first_name, presence: true, length: { in: 2..100 }
  validates :last_name, presence: true, length: { in: 2..100 }
  validates :email, presence: true, length: { in: 5..100 }, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }
  validates :phone, presence: true, length: { in: 10..16 }, format: { with: /\A[\d\s-]+\z/ }

  validates :shipping_address, :billing_address, presence: true, length: { in: 5..200 }, :allow_blank => true 
  validates :shipping_suburb, :billing_suburb, presence: true, length: { in: 2..50 }, format: { with: /\A[A-Za-z\s]+\z/ }, :allow_blank => true 
  validates :shipping_zip, :billing_zip, presence: true, :allow_blank => true 
  validates_inclusion_of :shipping_zip, :billing_zip, :in => 1000..9999, :allow_blank => true 
  validates :shipping_state, :billing_state, presence: true, length: { in: 2..3 }, :allow_blank => true 

  # Set the stripe secret key
  Stripe.api_key = Rails.configuration.default['STRIPE_API_KEY']

  def to_param
    slug
  end

  def set_gst(subtotal, gst)
    self.total = subtotal * (1 + (gst/100))
  end

  def create_charge token
    @amount = total * 100.0

    customer = Stripe::Customer.create(
      :email => email,
      :source  => token
    )

    charge = Stripe::Charge.create(
      :customer => customer.id,
      :amount => trim(@amount),
      :description => "Ecommerce Store Purchase",
      :currency => "aud"
    )
  rescue Stripe::CardError => e
    errors[:base] << e.message
  end

  private

  def trim num
    i, f = num.to_i, num.to_f
    i == f ? i : f
  end

  def set_slug
    loop do
      self.slug = SecureRandom.hex(10)
      break unless Checkout.where(slug: slug).exists?
    end
  end

end
