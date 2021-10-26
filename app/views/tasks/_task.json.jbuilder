json.extract! task, :id, :title, :content, :limit, :status, :priority, :reference, :created_at, :updated_at
json.url task_url(task, format: :json)
