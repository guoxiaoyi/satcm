class Setting < ApplicationRecord
  mount_uploader :banner_a, SettingUploader
  mount_uploader :banner_b, SettingUploader
  mount_uploader :logo, SettingUploader
  mount_uploader :qrcode, SettingUploader
end
