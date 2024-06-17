# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "orders/new", type: :view do
  before(:each) do
    assign(:order, Order.new(
      customer_email: "MyString",
      fulfilled: false,
      total: 1,
      address: "MyString"
    ))
  end

  it "renders new order form" do
    render

    assert_select "form[action=?][method=?]", orders_path, "post" do

      assert_select "input[name=?]", "order[customer_email]"

      assert_select "input[name=?]", "order[fulfilled]"

      assert_select "input[name=?]", "order[total]"

      assert_select "input[name=?]", "order[address]"
    end
  end
end
