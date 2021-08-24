class AddBriefToArticle < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :brief, :text
  end
end
