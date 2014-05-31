class AddShopsAssociationToProduct < ActiveRecord::Migration
  def change
    def self.up
      add_column :products, :shop_id, :integer
      add_index 'products', ['shop_id'], :name => 'index_shop_id'
    end

    def self.down
      remove_column :products, :shop_id
    end
  end
end
