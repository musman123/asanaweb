require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase
   test "index Action Should be true" do
    get :index
    assert_response :success
end
