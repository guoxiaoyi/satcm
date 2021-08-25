class Setting < ApplicationRecord
  mount_uploader :logo, SettingUploader
  mount_uploader :qrcode, SettingUploader
end
