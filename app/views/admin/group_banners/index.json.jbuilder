json.array!(@group_banners) do |group_banner|
  json.extract! group_banner, :path, :link, :position
  json.url group_banner_url(group_banner, format: :json)
end