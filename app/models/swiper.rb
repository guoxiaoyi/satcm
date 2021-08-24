class Swiper < ApplicationRecord
  mount_uploader :url, SwiperUploader

  validates :title, :url, presence: true
  # validates :name, uniqueness: true
end
