json.array!(@article_categories) do |article_category|
  json.extract! article_category, :name, :parent_id
  json.url article_category_url(article_category, format: :json)
end