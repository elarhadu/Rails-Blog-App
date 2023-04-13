require_relative '../rails_helper'

RSpec.describe 'Post testing', type: :feature do
  describe 'show page' do
    let(:user) { User.create(name: 'Jane Doe', photo: 'https://www.someurl.com', bio: 'Fullstack Developer', posts_counter: 1) }
    let(:post) do
      Post.create(title: 'My first post', text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                  comments_counter: 2, likes_counter: 1, author: user)
    end
    let!(:first_comment) { Comment.create(text: 'First comment', user:, post:) }
    let!(:second_comment) { Comment.create(text: 'Second comment', user:, post:) }
    let!(:like) { Like.create(user:, post:) }

    before do
      visit user_posts_path(user_id: user.id)
    end

    it "renders the user's profile picture" do
      expect(page).to have_xpath("//img[@src = '#{post.author.photo}' ]")
    end

    it 'renders the user name' do
      expect(page).to have_content(post.author.name)
    end

    it 'renders the number of posts the user has written' do
      expect(page).to have_content(post.author.posts_counter)
    end

    it 'renders the post text' do
      expect(page).to have_content(post.text)
    end

    it 'renders the first comment' do
      expect(page).to have_content('First comment')
    end

    it 'renders the number of comments' do
      expect(page).to have_content(post.comments_counter)
    end

    it 'renders the number of likes' do
      expect(page).to have_content(post.likes_counter)
    end
  end
end
