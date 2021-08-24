json.array!(@links) do |link|
  json.extract! link, :path, :name, :category
  json.url link_url(link, format: :json)
end