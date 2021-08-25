class CreateGroupBanners < ActiveRecord::Migration[5.2]
  def change
    create_table :group_banners do |t|
      t.string :path
      t.string :link
      t.integer :position

      t.timestamps
    end
  end
end
