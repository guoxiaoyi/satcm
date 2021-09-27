class AddHomeEnabledToScientificBanner < ActiveRecord::Migration[5.2]
  def change
    add_column :scientific_banners, :home_enabled, :boolean
    add_column :scientific_banners, :title, :string
  end
end
