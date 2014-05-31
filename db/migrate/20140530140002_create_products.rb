class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.string :picture
      t.decimal :price

      t.timestamps
    end
  end
end
