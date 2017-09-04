class Order < ApplicationRecord
	belongs_to :user
	belongs_to :order_status
  has_many :order_items

  before_create :set_order_status
  before_save :update_subtotal

	# validates :total, presence: true
	# validates :tax, presence: true
	# validates :gst, presence: true
	# validates :first_name, presence: true, length: { in: 5..100 }
	# validates :last_name, presence: true, length: { in: 5..100 }
	# validates :email, presence: true, length: { in: 5..100 }, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }
	# validates :address, presence: true, length: { in: 10..200 }
	# validates :suburb, presence: true, length: { in: 4..50 }, format: { with: /[a-zA-Z]/ }
	# validates :zip, presence: true
	# validates_inclusion_of :zip, :in => 1000..9999
	# validates :state, length: { in: 2..3 }
	# validates :phone, presence: true, length: { in: 10..16 }, format: { with: /[0-9]/ }
	# validates :user_id, presence: true

	def subtotal
    order_items.collect { |oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0 }.sum
  end

  def checking_out
  end

  private

	def set_order_status
    self.order_status_id = 1
  end

  def update_subtotal
    self[:subtotal] = subtotal
  end
end
