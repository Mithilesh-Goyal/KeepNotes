json.extract! consumer, :id, :name, :email, :login, :created_at, :updated_at
json.url consumer_url(consumer, format: :json)
