class Like < ApplicationRecord
  belongs_to :post
  belongs_to :user

  after_save :update_post_likes_counter

  def update_post_likes_counter
    post.update_likes_counter
  end
end
