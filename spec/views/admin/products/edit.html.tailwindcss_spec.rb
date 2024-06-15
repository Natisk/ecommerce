# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "admin/products/edit", type: :view do
  let(:admin_product) {
    Product.create!(
      name: "MyString",
      description: "MyText",
      price: 1,
      category: nil,
      active: false
    )
  }

  before(:each) do
    assign(:admin_product, admin_product)
  end

  it "renders the edit admin_product form" do
    render

    assert_select "form[action=?][method=?]", admin_product_path(admin_product), "post" do

      assert_select "input[name=?]", "admin_product[name]"

      assert_select "textarea[name=?]", "admin_product[description]"

      assert_select "input[name=?]", "admin_product[price]"

      assert_select "input[name=?]", "admin_product[category_id]"

      assert_select "input[name=?]", "admin_product[active]"
    end
  end
end
