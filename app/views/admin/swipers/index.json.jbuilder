json.array!(@swipers) do |swiper|
  json.extract! swiper, :title, :url, :position, :link
  json.url swiper_url(swiper, format: :json)
end