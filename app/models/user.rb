class User < ApplicationRecord
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
	:recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, :omniauth_providers => [:facebook]

	has_many :products
	has_many :categories
	has_many :orders
	has_many :banners
  has_many :checkouts

	has_attached_file :image, 
		styles: { 
			profile: "300x", thumb: "100x" 
		}, 
		:url => "/pictures/users/:id/:style/:filename", 
    :path => ":rails_root/public/pictures/users/:id/:style/:filename",
    :convert_options => {
      :profile => "-strip",
      :thumb => "-quality 75 -strip" 
    },
		default_url: "/images/missing.png"
  
  validates_attachment :image, 
    presence: true,
    content_type: { 
      content_type: ["image/jpeg", "image/jpg", "image/png"] 
    }, 
    if: Proc.new {|a| a.image.present? }

  validates :first_name, presence: false, length: { in: 2..100 }, :allow_blank => true 
  validates :last_name, presence: false, length: { in: 2..100 }, :allow_blank => true 
  validates :email, presence: true, length: { in: 5..100 }, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }
  validates :phone, presence: false, length: { in: 10..16 }, format: { with: /\A[\d\s-]+\z/ }, :allow_blank => true 

	validates :shipping_address, :billing_address, presence: false, length: { in: 5..200 }, :allow_blank => true 
  validates :shipping_suburb, :billing_suburb, presence: false, length: { in: 2..50 }, format: { with: /\A[A-z]+\z/ }, :allow_blank => true 
  validates :shipping_zip, :billing_zip, presence: false, :allow_blank => true 
  validates_inclusion_of :shipping_zip, :billing_zip, :in => 1000..9999, :allow_blank => true 
  validates :shipping_state, :billing_state, presence: false, length: { in: 2..3 }, :allow_blank => true 

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.first_name = auth.extra.raw_info.first_name
      user.last_name = auth.extra.raw_info.last_name
      # If you are using confirmable and the provider(s) you use validate emails, 
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end
end
