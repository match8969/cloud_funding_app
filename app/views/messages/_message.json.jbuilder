json.extract! message, :id, :content, :from_user_id, :message_group_id, :created_at, :updated_at
json.url message_url(message, format: :json)
