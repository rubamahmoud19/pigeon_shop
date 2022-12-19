require 'rails_helper'

RSpec.describe Basket, type: :model, stripe: true do

  describe '#set_total' do
    before do
      3.times { FactoryBot.create(:product) }
      Basket.create(product_ids: Product.all.pluck(:id))
    end

    it "set the total of basket's products" do
      expect(Basket.last.total).to eq(300)
    end

  end
end
