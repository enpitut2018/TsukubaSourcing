json.extract! job, :id, :title, :user_id, :descrition, :created_at, :updated_at
json.url job_url(job, format: :json)
