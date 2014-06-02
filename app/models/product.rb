class Product < ActiveRecord::Base
  belongs_to :shop
  has_many :orders, through: :order_items

  validates :name, presence: true
  validates :price, presence: true

  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

  accepts_nested_attributes_for :shop, reject_if: proc { |attributes| attributes['name'].blank? }


  # def shop_name_link
  #   if current_user && current_user.admin?
  #     link_to "##{self.shop_id}-#{self.shop.name}", edit_shop_path(self.shop) rescue 'n/a'
  #   else
  #     "#{self.shop.name}" rescue 'n/a'
  #   end
  # end
end
