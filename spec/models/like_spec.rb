require 'rails_helper'

RSpec.describe Like, type: :model do
  user = User.create(name: 'Jane Doe', photo: 'photo url', bio: 'A developer from Ghana', posts_counter: 0)
  user2 = User.create(name: 'John Doe', photo: 'photo url', bio: 'A developer from Ghana', posts_counter: 0)
  post = Post.create(author: user, title: 'Journey from no stack to full-stack', text: 'A post by user', comments_counter: 0, likes_counter: 0)
  Like.create(post:, user: user2)

  it 'Update likes counter' do
    expect(post.likes_counter).to eq(1)
  end
end
