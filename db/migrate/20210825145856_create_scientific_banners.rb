class CreateScientificBanners < ActiveRecord::Migration[5.2]
  def change
    create_table :scientific_banners do |t|
      t.string :path
      t.string :link
      t.integer :position

      t.timestamps
    end
  end
end
