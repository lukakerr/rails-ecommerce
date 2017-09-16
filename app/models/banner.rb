class Banner < ApplicationRecord
	has_many :pictures, as: :imageable, dependent: :delete_all
	belongs_to :user
	accepts_nested_attributes_for :pictures, allow_destroy: true

	validates :name, presence: true, length: { in: 2..30 }, format: { with: /\A[A-Za-z\s]+\z/ }

	def self.image_styles
    {
      original: "1500x",
      thumb: "300x300#",
    }
  end
end
