json.extract! job, :id, :title, :user_id, :description, :created_at, :updated_at
json.url job_url(job, format: :json)
