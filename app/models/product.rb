class Product < ActiveRecord::Base
  belongs_to :shop

  def self.pizza
    RandomPizza.new.suggestion
  end
end
