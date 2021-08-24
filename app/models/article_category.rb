class ArticleCategory < ActiveRecord::Base
  acts_as_nested_set
  validates :name, presence: true
  validates :name, uniqueness: true

  has_many :articles
end
