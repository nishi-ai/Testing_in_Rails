Rails app generated with [lewagon/rails-templates](https://github.com/lewagon/rails-templates), created by the [Le Wagon coding bootcamp](https://www.lewagon.com) team.

Why testing is neceesarry?
insert screenshot of mistake
heroku story

manual testing save code and refesh the page
insert browser error message

Automated Testing
2 ways 
rake Rspec
rails way, Minitest

2 types of test 
System Test (using browser: external dependecy)
Unit Test (quick one behavior of model, no dependency)

System Test
Setup:
We’ll test against a real browser. We’ll do System Testing.
Gem "launchy"

In test_helper.rb

<!--  Devise test helpers -->
  include Warden::Test::Helpers
  Warden.test_mode!

<!--  Register the new driver for Capybara -->
Capybara is a connection between local and browser.
You should tell on which browser you test.

Headless Chrome is shipping in Chrome 59. It's a way to run the Chrome browser in a headless environment. Essentially, running Chrome without chrome! It brings all modern web platform features provided by Chromium and the Blink rendering engine to the command line.

Why is that useful?

A headless browser is a great tool for automated testing and server environments where you don't need a visible UI shell. For example, you may want to run some tests against a real web page, create a PDF of it, or just inspect how the browser renders an URL.

# test/system/products_test.rb
Test Principle
4 phases
    # setup
    # exercise
    # verify
    # teardown

run  rails test:system
insert terminal error message

# save_and_open_screenshot
insert screenshot

TDD
Test Driven Development

How to: 
write a test code first and run rails test:system and see the error messages
follow these error messages, until get green, implement code and run test:system every single change.
test "lets a signed in user create a new product" do
    login_as users(:ai)
    visit "/products/new"
# save_and_open_screenshot
    insert error png

    fill_in "product_name", with: "AI by ai"
    fill_in "product_tagline", with: "AI product made by ai"
# save_and_open_screenshot
insert error png

    click_on 'Create Product'

    # Should be redirected to Home with new product
    assert_selector root_path, page.current_path
    assert_selector "AI product made by ai"
  end