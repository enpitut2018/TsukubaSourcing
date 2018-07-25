json.extract! jobcomment, :id, :comment, :star, :job_id, :created_at, :updated_at
json.url jobcomment_url(jobcomment, format: :json)
