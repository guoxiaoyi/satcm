class AddPermToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :perm, :string, default: ''
  end
end
