require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest
  
  test "get a new category from create category" do
    get new_category_path
    assert_template 'categories/new'
    assert_difference 'category.count', 1 do
      post_via_redirect categories_path, category: {name: 'Sports'}
    end
    assert_template 'categories/index'
    assert_match "Sports", response.body
  end
end