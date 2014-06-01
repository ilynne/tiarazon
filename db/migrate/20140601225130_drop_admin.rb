class DropAdmin < ActiveRecord::Migration
  def change
    drop_table :admins
  end
end
