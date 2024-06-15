# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "admin/products/show", type: :view do
  before(:each) do
    assign(:admin_product, Product.create!(
      name: "Name",
      description: "MyText",
      price: 2,
      category: nil,
      active: false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(//)
    expect(rendered).to match(/false/)
  end
end
