class Article < ApplicationRecord
  belongs_to :article_category
  validates :title, :content, :article_category_id, presence: true
end
