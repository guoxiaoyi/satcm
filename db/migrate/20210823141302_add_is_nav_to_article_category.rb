class AddIsNavToArticleCategory < ActiveRecord::Migration[5.2]
  def change
    add_column :article_categories, :is_nav, :boolean
  end
end
