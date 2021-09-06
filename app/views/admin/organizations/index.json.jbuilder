json.array!(@organizations) do |organization|
  json.extract! organization, :title, :content, :position
  json.url organization_url(organization, format: :json)
end