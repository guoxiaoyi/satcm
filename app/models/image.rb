class Image < ApplicationRecord
  mount_uploader :file, ArticleUploader
end
