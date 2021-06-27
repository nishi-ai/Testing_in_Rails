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
    assert_equal root_path, page.current_path
    assert_text "AI product made by ai"
  end


Unit Test
run rails test:models = only test models
# test/models/user_test.rb

test "full_name returns the capitalised first name and last name" do
    user = User.new(first_name: 'Ai', last_name: 'Nishikawa')
    
    assert_equal 'Ai Nishikawa', user.full_name
  end

run rails test:models = only test models

insert error message

of course we do not have column of full_name

how to solve?
go User model and create a full_name definition

def full_name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end