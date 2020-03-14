class PostImage < ApplicationRecord
	belongs_to :user
	attachment :image
	validates :image, presence: true
end
