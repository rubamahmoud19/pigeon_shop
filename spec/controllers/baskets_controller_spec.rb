require 'rails_helper'

RSpec.describe BasketsController, type: :controller do
  
  describe 'POST /cretae' do
    before do
      3.times { FactoryBot.create(:product) }
    end

    it 'creates a new Basket' do
      expect {
        post :create, params: { basket: { product_ids: Product.all.pluck(:id) } }
      }.to change(Basket, :count).by(1) 
    end
  end
end
