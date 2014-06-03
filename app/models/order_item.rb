class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product

  accepts_nested_attributes_for :order

  def total
    self.price * self.quantity
  end
end
