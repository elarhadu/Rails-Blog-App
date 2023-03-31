require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.create(name: 'Elarh Adu', photo: 'photo url', bio: 'A software developer from Ghana', posts_counter: 0) }

  it 'User must have a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'Posts counter must be an integer greater than or equal to zero.' do
    subject.posts_counter = -5
    expect(subject).to_not be_valid
  end

  it 'Show recent posts method' do
    5.times { subject.posts.create(title: 'title', text: 'This is a post', comments_counter: 5, likes_counter: 5) }
    expect(subject.recent_posts.count).to eq(3)
  end
end
