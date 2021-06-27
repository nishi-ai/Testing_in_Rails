require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "full_name returns the capitalised first name and last name" do
    user = User.new(first_name: 'Ai', last_name: 'Nishikawa')
    
    assert_equal 'Ai Nishikawa', user.full_name
  end
end
