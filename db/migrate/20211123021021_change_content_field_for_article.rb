class ChangeContentFieldForArticle < ActiveRecord::Migration[5.2]
  def change
    change_column :articles, :content, :longtext
  end
end
