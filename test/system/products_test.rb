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

  test "lets a signed in user create a new product" do
    login_as users(:ai) # is a method of Warden::TestHelpers from test_helper.rb
    visit "/products/new"
    # now need to add routes 
    # and then need new definition

    # save_and_open_screenshot

   
    fill_in "product_name", with: "AI by ai"
    fill_in "product_tagline", with: "AI product made by ai"
    # now need create definition
    # save_and_open_screenshot

    click_on 'Create Product'
   
    # Should be redirected to Home with new product
    assert_equal root_path, page.current_path
    assert_text "AI product made by ai"
    save_and_open_screenshot
  end
end
