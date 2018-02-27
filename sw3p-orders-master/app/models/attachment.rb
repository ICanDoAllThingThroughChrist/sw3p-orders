class Attachment < ApplicationRecord
  has_many :orders
  mount_uploader :file, AttachmentUploader
end
