class CreateNavigationBars < ActiveRecord::Migration[5.2]
  def change
    create_table :navigation_bars do |t|
      t.string :name
      t.string :url
      t.integer :position

      t.timestamps
    end
  end
end
