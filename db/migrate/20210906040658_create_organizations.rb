class CreateOrganizations < ActiveRecord::Migration[5.2]
  def change
    create_table :organizations do |t|
      t.string :title
      t.text :content
      t.integer :position

      t.timestamps
    end
  end
end
