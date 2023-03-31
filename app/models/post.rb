class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  def update_author_posts_counter
    author.update(posts_counter: author.posts.count)
  end

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  def update_comments_counter
    update(comments_counter: comments.count)
  end

  def update_likes_counter
    update(likes_counter: likes.count)
  end
end
