require "application_system_test_case"

class ProductsTest < ApplicationSystemTestCase
  test "visiting the room" do
    visit root_path

    assert_selector "h1", text: "Welcome to GK's product hunt clone"
    assert_selector ".card", count: Product.count
  end

  test "adding a new product" do
    login_as users(:george)
    visit new_product_path
    fill_in "product_name", with: "Reddit"
    fill_in "product_tagline", with: "Frontpage of the internet"

    click_on 'Create Product'

    #save_and_open_screenshot
    assert_equal root_path, page.current_path

    assert_text "Frontpage of the internet"
  end



  test "updating a product" do
    login_as users(:george)
    product_1 = products(:product_1)
    visit edit_product_path(product_1)
    fill_in "product_name", with: "Reddit 2"
    fill_in "product_tagline", with: "Frontpage of my personnal internet"

    click_on 'Update Product'

    #save_and_open_screenshot
    assert_equal root_path, page.current_path

    assert_text "Frontpage of my personnal internet"

  end
end
