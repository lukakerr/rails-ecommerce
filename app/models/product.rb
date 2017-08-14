class Product < ApplicationRecord
	belongs_to :category
	belongs_to :user
	belongs_to :order, :optional => true
	has_many :pictures, dependent: :destroy
end
