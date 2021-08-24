class CreateLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :links do |t|
      t.string :path
      t.string :name
      t.string :category

      t.timestamps
    end
  end
end
