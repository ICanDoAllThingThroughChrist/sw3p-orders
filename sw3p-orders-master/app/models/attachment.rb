class Attachment < ApplicationRecord
  belongs_to :order
  mount_uploader :file, AttachmentUploader
end
