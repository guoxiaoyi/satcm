json.array!(@settings) do |setting|
  json.extract! setting, :logo, :tel, :address, :qrcode, :banner_a, :banner_b, :oa_path
  json.url setting_url(setting, format: :json)
end