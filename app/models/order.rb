class Order < ApplicationRecord
  belongs_to :user
  belongs_to :order_status
  belongs_to :checkout, optional: true
  has_many :order_items

  before_create :set_order_status
  before_save :set_gst, :set_tax, :update_subtotal

  # validates :total, presence: true
  # validates :tax, presence: true
  # validates :gst, presence: true

  def subtotal
    order_items.collect { |oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0 }.sum
  end

  private

  def set_order_status
    self.order_status_id = 1
  end

  def update_subtotal
    self[:subtotal] = subtotal
  end

  def set_gst
    self[:gst] = 10
  end

  def set_tax
    self[:tax] = 1
  end
end
