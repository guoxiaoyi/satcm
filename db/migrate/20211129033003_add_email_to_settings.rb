class AddEmailToSettings < ActiveRecord::Migration[5.2]
  def change
    add_column :settings, :email, :string
    add_column :settings, :home_bg, :string
    add_column :settings, :icp, :string
  end
end
