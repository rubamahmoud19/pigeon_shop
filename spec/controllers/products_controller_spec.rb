require 'rails_helper'

RSpec.describe ProductsController, type: :controller do

  describe 'GET #index' do
    before do
      3.times { FactoryBot.create(:product) }
      get :index
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'returns the correct length for products' do
      expect(assigns(:products).length).to eq(3)
    end
  end

end