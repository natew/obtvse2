require 'test_helper'

module Obtvse
  class UsersControllerTest < ActionController::TestCase

    test "should get new" do
      get :new
      assert_response :success
    end

  end
end
