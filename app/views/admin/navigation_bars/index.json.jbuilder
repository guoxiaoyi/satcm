json.array!(@navigation_bars) do |navigation_bar|
  json.extract! navigation_bar, :name, :url, :custom_order
  json.url navigation_bar_url(navigation_bar, format: :json)
end