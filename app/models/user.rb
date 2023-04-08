class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id', class_name: 'Post'
  has_many :comments, foreign_key: 'user_id', class_name: 'Comment'

  validates :name, presence: true
  validates :posts_counter, numericality: { greater_than_or_equal_to: 0, only_integer: true }

  after_initialize do |user|
    user.posts_counter ||= 0
  end

  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
