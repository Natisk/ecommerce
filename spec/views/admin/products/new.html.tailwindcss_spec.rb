# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "admin/products/new", type: :view do
  before(:each) do
    assign(:admin_product, Product.new(
      name: "MyString",
      description: "MyText",
      price: 1,
      category: nil,
      active: false
    ))
  end

  it "renders new admin_product form" do
    render

    assert_select "form[action=?][method=?]", admin_products_path, "post" do

      assert_select "input[name=?]", "admin_product[name]"

      assert_select "textarea[name=?]", "admin_product[description]"

      assert_select "input[name=?]", "admin_product[price]"

      assert_select "input[name=?]", "admin_product[category_id]"

      assert_select "input[name=?]", "admin_product[active]"
    end
  end
end
