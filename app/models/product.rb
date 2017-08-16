class Product < ApplicationRecord
	belongs_to :category
	belongs_to :user
	belongs_to :order, :optional => true
	has_many :pictures, dependent: :destroy

	validates :name, presence: true, length: { in: 5..200 }
	validates :description, presence: true, length: { in: 10..400 }
	validates :price, presence: true
	validates :quantity, presence: true
	validates :category_id, presence: true
	validates :user_id, presence: true
end
