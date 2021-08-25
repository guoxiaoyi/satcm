class ImageLink < ApplicationRecord
  mount_uploader :path, ArticleUploader
end
