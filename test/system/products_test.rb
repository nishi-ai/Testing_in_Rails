require "application_system_test_case"
# require this, because this file is configured which browser used for capybara

class ProductsTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit root_url
    # save_and_open_screenshot
    assert_selector "h1", text: "Awesome Products" # if it's true, the test PASSED
  end

  test "displys as much cards on Index page as products in db" do
    visit root_url
    # save_and_open_screenshot
    assert_selector ".card-product", count: Product.count
  end
end
