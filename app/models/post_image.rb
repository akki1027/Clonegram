class PostImage < ApplicationRecord
	belongs_to :user
	attachment :image
	validates :image, presence: true
	has_many :post_comments, dependent: :destroy
end
