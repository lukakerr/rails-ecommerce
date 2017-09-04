class Checkout < ApplicationRecord
  belongs_to :user
  has_one :order

  validates :total, presence: true
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
