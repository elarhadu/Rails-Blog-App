require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { User.create(name: 'Jane Doe', photo: 'photo url', bio: 'A developer from Ghana', posts_counter: 0) }
  let(:post) do
    Post.create(author: user, title: 'From zero to hero', text: 'Journey from no stack to full-stack',
                comments_counter: 0, likes_counter: 2)
  end

  subject do
    Comment.create(post:, user:, text: 'This is a comment')
  end

  it 'updates comments counter attribute' do
    expect { subject }.to change { post.comments_counter }.from(0).to(1)
    expect { Comment.create(post:, user:, text: 'Another comment') }.to change {
                                                                          post.comments_counter
                                                                        }.from(1).to(2)
  end
end
