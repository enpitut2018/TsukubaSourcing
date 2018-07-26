json.extract! jobs_evaluation, :id, :comment, :star, :user_id, :created_at, :updated_at
json.url jobs_evaluation_url(jobs_evaluation, format: :json)
