require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #index' do
    it 'returns a successful response' do
      get :index
      expect(response).to be_successful
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end
  end

  describe 'GET #show' do
    let!(:user) { User.create(name: 'John Doe') }

    it 'returns a successful response' do
      get :show, params: { id: user.id }
      expect(response).to be_successful
    end

    it 'renders the show template' do
      get :show, params: { id: user.id }
      expect(response).to render_template('show')
    end
  end
end
