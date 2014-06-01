class Product < ActiveRecord::Base
  belongs_to :shop

  validates :name, presence: true
  validates :price, presence: true

  accepts_nested_attributes_for :shop
end
