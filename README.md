Rails app generated with [lewagon/rails-templates](https://github.com/lewagon/rails-templates), created by the [Le Wagon coding bootcamp](https://www.lewagon.com) team.

# Practice Testing Rails App

## Why testing is neceesarry?

Supposed, you won't notice this mistake, product.title, but actually here is supposed to be product.name

![image](https://user-images.githubusercontent.com/60405643/123553959-27e37000-d77e-11eb-96cd-a0be2bd59966.png)

Manuall Testing (refresh the page)

![image](https://user-images.githubusercontent.com/60405643/123554007-637e3a00-d77e-11eb-8483-a0d9b590a9a3.png)

### What if you can forget to test manually and pushed your code to production
and run all steps you need to deploy

`git push heroku master`

`heroku run rails db:migrate db:seed`

`heroku open`

After wating for 100 years of deploying, heroku tells you only, 

![image](https://user-images.githubusercontent.com/60405643/123554296-9a088480-d77f-11eb-982e-55a38e0cbe07.png)

`heroku rollback`

`heroku run rails db:rollback`

And check where the issue comes from
`heroku logs --tail`

Fixing bugs and push to heroku again...

It takes too much time.

## Automated Testing

- rake Rspec
- rails way, Minitest

2 types of test 

- System Test (using browser: external dependecy)
- Unit Test (quick one behavior of model, no dependency)

# System Test

Setup:
We’ll test against a real browser. We’ll do System Testing.

`Gem "launchy"`

In test_helper.rb

- Add Devise test helpers

  ```Warden::Test::Helpers  Warden.test_mode!```

- Register the new driver for Capybara
  
  ```Capybara.register_driver :headless_chrome```
  
  Capybara is a connection between local and browser.
  You should tell on which browser you test.

  **eadless Chrome is shipping in Chrome 59. It's a way to run the Chrome browser in a headless environment. Essentially, running Chrome without chrome! It brings all modern web platform features provided by Chromium and the Blink rendering engine to the command line.

  *Why is that useful?

  *A headless browser is a great tool for automated testing and server environments where you don't need a visible UI shell. For example, you may want to run some tests against a real web page, create a PDF of it, or just inspect how the browser renders an URL.

# Test Principle

4 phases

- setup
- exercise
- verify
- teardown

Test code in test/system/products_test.rb

run  `rails test:system`

![image](https://user-images.githubusercontent.com/60405643/123554781-fb315780-d781-11eb-94a1-ece287b98b0f.png)

put `save_and_open_screenshot`

![image](https://user-images.githubusercontent.com/60405643/123554799-18febc80-d782-11eb-9f83-cd6007eeee82.png)


# TDD
Test Driven Development

## How to: 
write a test code first and run rails test:system and see the error messages

Just follow these error messages, until get green, implement code and run test:system every single change.

  ```test "lets a signed in user create a new product" do
      login_as users(:ai)
      visit "/products/new"


      fill_in "product_name", with: "AI by ai"
      fill_in "product_tagline", with: "AI product made by ai"

      click_on 'Create Product'

      # Should be redirected to Home with new product
      assert_equal root_path, page.current_path
      assert_text "AI product made by ai"
    end
  ```
 
 ![image](https://user-images.githubusercontent.com/60405643/123554944-e903e900-d782-11eb-8656-19f3f6829e8d.png)
  
 ![image](https://user-images.githubusercontent.com/60405643/123554990-2f594800-d783-11eb-8a6b-eb1cbf2554fe.png)
 
 ![image](https://user-images.githubusercontent.com/60405643/123554991-308a7500-d783-11eb-8b79-46fd8b31e287.png)

 ![image](https://user-images.githubusercontent.com/60405643/123554994-32eccf00-d783-11eb-829e-2b5bb5e6adaf.png)


# Unit Test
run `rails test:models` = only test models

in test/models/user_test.rb

```
test "full_name returns the capitalised first name and last name" do
    user = User.new(first_name: 'Ai', last_name: 'Nishikawa')
    
    assert_equal 'Ai Nishikawa', user.full_name
  end
```

![image](https://user-images.githubusercontent.com/60405643/123555036-7c3d1e80-d783-11eb-8b30-4046bdf33519.png)

...off course, we do not have column of full_name

## how to solve?

go User model and create a full_name definition

```
def full_name
    "#{first_name.capitalize} #{last_name.capitalize}"
end
```
