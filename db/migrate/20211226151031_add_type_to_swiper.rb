class AddTypeToSwiper < ActiveRecord::Migration[5.2]
  def change
    add_column :swipers, :category, :string, default: ''
  end
end
