class Category < ApplicationRecord
	has_many :products
	belongs_to :user

	validates :name, presence: true, length: { in: 2..30 }, format: { with: /\A[A-z]+\z/ }

  has_attached_file :image, 
    styles: { 
      original: "300x" 
    }, 
    :url => "/pictures/categories/:id/:style/:filename", 
    :path => ":rails_root/public/pictures/categories/:id/:style/:filename",
    :convert_options => {
      :original => "-strip",
    },
    default_url: "/images/missing.png"
  
  validates_attachment :image, 
    presence: true,
    content_type: { 
      content_type: ["image/jpeg", "image/jpg", "image/png"] 
    }, 
    if: Proc.new {|a| a.image.present? }
end
