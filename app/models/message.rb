class Message < ActiveRecord::Base
  belongs_to :user
  belongs_to :room
  belongs_to :group
end
