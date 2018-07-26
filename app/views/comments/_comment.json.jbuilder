json.extract! comment, :id, :job_id, :user_id, :message, :visible, :created_at, :updated_at
json.url comment_url(comment, format: :json)
