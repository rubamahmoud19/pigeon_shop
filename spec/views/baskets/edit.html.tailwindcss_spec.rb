require 'rails_helper'

RSpec.describe "baskets/edit", type: :view do
  let(:basket) {
    Basket.create!()
  }

  before(:each) do
    assign(:basket, basket)
  end

  it "renders the edit basket form" do
    render

    assert_select "form[action=?][method=?]", basket_path(basket), "post" do
    end
  end
end
