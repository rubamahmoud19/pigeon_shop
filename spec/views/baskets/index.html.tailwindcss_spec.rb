require 'rails_helper'

RSpec.describe "baskets/index", type: :view do
  before(:each) do
    assign(:baskets, [
      Basket.create!(),
      Basket.create!()
    ])
  end

  it "renders a list of baskets" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
  end
end
