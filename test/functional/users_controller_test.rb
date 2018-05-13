require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  def setup
    User.all.each { |user| user.destroy! }
  end
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get create" do
    post :create, user: {email: "foo@example.com", password: "simple", password_confirmation: "simple"}
    assert_redirected_to admin_path
  end

end
