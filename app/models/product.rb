class Product < ApplicationRecord
	belongs_to :category
	belongs_to :user
	# belongs_to :order, :optional => true
	has_many :pictures, as: :imageable, dependent: :delete_all
  has_many :order_items

  default_scope { where(sold_out: false) }

	accepts_nested_attributes_for :pictures, allow_destroy: true

	validates :name, presence: true, length: { in: 5..200 }
	validates :description, presence: true, length: { in: 10..400 }
	validates :price, presence: true
	validates :quantity, presence: true, :inclusion => 1..999
	validates :category_id, presence: true
	validates :user_id, presence: true

	def self.image_styles
    {
      original: "1000x", 
      product: "750x", 
      grid: "300x300#", 
      thumb: "100x" 
    }
  end
end
