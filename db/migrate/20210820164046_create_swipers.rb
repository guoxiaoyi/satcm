class CreateSwipers < ActiveRecord::Migration[5.2]
  def change
    create_table :swipers do |t|
      t.string :title
      t.string :url
      t.string :link
      t.integer :position

      t.timestamps
    end
  end
end
