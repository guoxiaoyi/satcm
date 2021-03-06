class CreateArticleCategories < ActiveRecord::Migration[4.2]
  def change
    create_table :article_categories do |t|
      t.string :name
      t.integer :parent_id, null: true, index: true
      t.integer :lft, null: false, index: true
      t.integer :rgt, null: false, index: true

      # optional fields
      t.integer :depth, null: false, default: 0
      t.integer :children_count, null: false, default: 0

      t.string :custom_key
      t.timestamps
    end
  end
end
