json.extract! post_image, :id, :image_id, :caption, :location, :user_id, :created_at, :updated_at
json.url post_image_url(post_image, format: :json)
