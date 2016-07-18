class Message < ActiveRecord::Base
  mount_uploaders :attached_file, AttachmentUploader	
  belongs_to :user
  belongs_to :room
  belongs_to :group
end
