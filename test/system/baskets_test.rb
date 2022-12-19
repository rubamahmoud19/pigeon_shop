require "application_system_test_case"

class BasketsTest < ApplicationSystemTestCase
  setup do
    @basket = baskets(:one)
  end

  test "visiting the index" do
    visit baskets_url
    assert_selector "h1", text: "Baskets"
  end

  test "should create basket" do
    visit baskets_url
    click_on "New basket"

    fill_in "Discount", with: @basket.discount
    fill_in "To pay", with: @basket.to_pay
    fill_in "Total", with: @basket.total
    click_on "Create Basket"

    assert_text "Basket was successfully created"
    click_on "Back"
  end

  test "should update Basket" do
    visit basket_url(@basket)
    click_on "Edit this basket", match: :first

    fill_in "Discount", with: @basket.discount
    fill_in "To pay", with: @basket.to_pay
    fill_in "Total", with: @basket.total
    click_on "Update Basket"

    assert_text "Basket was successfully updated"
    click_on "Back"
  end

  test "should destroy Basket" do
    visit basket_url(@basket)
    click_on "Destroy this basket", match: :first

    assert_text "Basket was successfully destroyed"
  end
end
