# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "orders/edit", type: :view do
  let(:order) {
    Order.create!(
      customer_email: "MyString",
      fulfilled: false,
      total: 1,
      address: "MyString"
    )
  }

  before(:each) do
    assign(:order, order)
  end

  it "renders the edit order form" do
    render

    assert_select "form[action=?][method=?]", order_path(order), "post" do

      assert_select "input[name=?]", "order[customer_email]"

      assert_select "input[name=?]", "order[fulfilled]"

      assert_select "input[name=?]", "order[total]"

      assert_select "input[name=?]", "order[address]"
    end
  end
end
