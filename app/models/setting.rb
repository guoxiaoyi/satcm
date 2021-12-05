class Setting < ApplicationRecord
  mount_uploader :logo, SettingUploader
  mount_uploader :qrcode, SettingUploader
  mount_uploader :home_bg, SettingUploader
end
