RSpec.describe PostsController, type: :request do
  describe 'GET index' do
    let(:user) { User.create(name: 'John Doe') }
    let!(:post1) { Post.create(title: 'Post 1', text: 'Lorem ipsum', author: user) }
    let!(:post2) { Post.create(title: 'Post 2', text: 'Dolor sit amet', author: user) }

    it 'returns a successful response and includes correct placeholder text' do
      get user_posts_path(user)
      expect(response).to be_successful
      expect(response.body).to include('Welcome to our Posts Page')
    end

    it 'renders the index template' do
      get user_posts_path(user)
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #show' do
    let(:user) { User.create(name: 'John Doe') }
    let!(:post) { Post.create(title: 'First Post', text: 'Lorem ipsum', author: user) }

    it 'returns a successful response and includes correct placeholder text' do
      get user_post_path(user, post)
      expect(response).to be_successful
      expect(response.body).to include('Posts created by users')
    end

    it 'renders the show template' do
      get user_post_path(user, post)
      expect(response).to render_template(:show)
    end
  end
end
