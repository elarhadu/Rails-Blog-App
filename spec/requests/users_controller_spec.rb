require 'rails_helper'

RSpec.describe UsersController, type: :request do
  describe 'GET /index' do
    before(:example) { get '/users' }

    it 'returns http success' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders the index template' do
      expect(response).to render_template(:index)
    end

    it 'includes the correct placeholder text in the response body' do
      expect(response.body).to include('A list of Users')
    end
  end
end
