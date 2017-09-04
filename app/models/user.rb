class User < ApplicationRecord
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
	:recoverable, :rememberable, :trackable, :validatable

	has_many :products
	has_many :categories
	has_many :orders
	has_many :banners

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
		default_url: "/images/:style/missing.png"
  
  validates_attachment :image, 
    presence: true,
    content_type: { 
      content_type: ["image/jpeg", "image/jpg", "image/png"] 
    }

  validates :first_name, presence: true, length: { in: 2..100 }
  validates :last_name, presence: true, length: { in: 2..100 }
  validates :email, presence: true, length: { in: 5..100 }, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }
	validates :address, presence: true, length: { in: 5..200 }
	validates :suburb, presence: true, length: { in: 2..50 }, format: { with: /[a-zA-Z]/ }
	validates :zip, presence: true
	validates_inclusion_of :zip, :in => 1000..9999
	validates :state, presence: true, length: { in: 2..3 }
	validates :phone, presence: true, length: { in: 10..16 }, format: { with: /[0-9]/ }
end
