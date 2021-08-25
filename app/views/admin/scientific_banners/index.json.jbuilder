json.array!(@scientific_banners) do |scientific_banner|
  json.extract! scientific_banner, :path, :link, :position
  json.url scientific_banner_url(scientific_banner, format: :json)
end