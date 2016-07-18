class Message < ActiveRecord::Base
  mount_uploader :attached_file, AttachmentUploader
  belongs_to :user
  belongs_to :room
  belongs_to :group
end
