json.array!(@image_links) do |image_link|
  json.extract! image_link, :path, :link, :position
  json.url image_link_url(image_link, format: :json)
end