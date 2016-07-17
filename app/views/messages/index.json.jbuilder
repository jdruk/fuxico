json.array!(@messages) do |message|
  json.extract! message, :id, :message, :attached_file, :user_id, :private_for, :room_id, :group_id
  json.url message_url(message, format: :json)
end
