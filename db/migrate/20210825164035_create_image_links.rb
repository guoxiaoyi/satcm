class CreateImageLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :image_links do |t|
      t.string :path
      t.string :link
      t.integer :position

      t.timestamps
    end
  end
end
