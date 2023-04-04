require 'rails_helper'

RSpec.describe PostsController, type: :request do
  describe 'GET index' do
    let(:user) { User.create(name: 'John Doe') }
    let!(:post1) { Post.create(title: 'Post 1', text: 'Lorem ipsum', author: user) }
    let!(:post2) { Post.create(title: 'Post 2', text: 'Dolor sit amet', author: user) }

    it 'returns a successful response' do
      get user_posts_path(user)
      expect(response).to be_successful
    end

    it 'renders the index template' do
      get user_posts_path(user)
      expect(response).to render_template(:index)
    end
  end
end
