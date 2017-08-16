class Category < ApplicationRecord
	has_many :products
	belongs_to :user

	validates :name, presence: true, length: { in: 2..30 }, format: { with: /[a-zA-Z]/ }
end
