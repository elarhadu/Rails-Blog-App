RSpec.describe PostsController, type: :request do
  describe 'GET index' do
    let(:user) { User.create(name: 'John Doe') }
    let!(:post1) { Post.create(title: 'Post 1', text: 'Lorem ipsum', author: user) }
    let!(:post2) { Post.create(title: 'Post 2', text: 'Dolor sit amet', author: user) }

    it 'returns a successful response and includes correct placeholder text' do
      get user_posts_path(user)
      expect(response).to be_successful
      expect(response.body).to include('This is a lists of all Posts written by our Unique User John Doe😎')
    end

    it 'renders the index template' do
      get user_posts_path(user)
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #show' do
    before(:example) { get user_post_path(user_id: 1, id: 1) }

    it 'returns http success status' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'show' template" do
      expect(response).to render_template(:show)
    end

    it 'response body includes correct placeholder text' do
      expect(response.body).to include('This is the first Post written by our Unique User John Doe😎')
    end
  end
end
