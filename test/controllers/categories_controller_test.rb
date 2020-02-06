require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest

	def setup
		@category = Category.create(name: "sport")
		@user = User.create(username: "john", email: "john@example.com", password: "Password", admin: true)
	end

	test "shoud get index path" do
		get categories_path
		assert_response :success
	end

	test "shoud get new path" do
		sign_in_as(@user, "Password")
		get new_category_path
		assert_response :success
	end

	test "shoud get show path" do
		get category_path(@category)
		assert_response :success
	end

	  test "should redirect create when admin not logged in" do
	    assert_no_difference 'Category.count' do
	      post categories_path, params: { category: { name: "sports" } }
	    end
	    assert_redirected_to categories_path
	  end

end
