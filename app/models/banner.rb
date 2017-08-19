class Banner < ApplicationRecord
	has_many :pictures, as: :imageable, dependent: :delete_all
	belongs_to :user
end
