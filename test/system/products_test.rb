require "application_system_test_case"
# require this, because this file is configured which browser used for capybara

class ProductsTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit root_url
  
    assert_selector "h1", text: "Product"
  end
end
