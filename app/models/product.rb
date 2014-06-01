class Product < ActiveRecord::Base
  belongs_to :shop

  validates :name, presence: true
end
