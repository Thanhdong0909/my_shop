class AddColumsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :provide, :string
    add_column :users, :uid, :string
    add_column :users, :image, :string
  end
end
