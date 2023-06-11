json.extract! post, :id, :full_name, :age, :location, :description, :special_note, :created_at, :updated_at
json.url post_url(post, format: :json)
