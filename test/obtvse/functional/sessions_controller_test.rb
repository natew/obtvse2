require 'test_helper'
module Obtvse
  class SessionsControllerTest < ActionController::TestCase

    test "should get new" do
      get :new
      assert_response :success
    end

  end
end
