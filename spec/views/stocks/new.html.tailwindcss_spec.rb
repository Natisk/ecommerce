# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "stocks/new", type: :view do
  before(:each) do
    assign(:stock, Stock.new(
      size: 1,
      amount: 1,
      product: nil
    ))
  end

  it "renders new stock form" do
    render

    assert_select "form[action=?][method=?]", stocks_path, "post" do

      assert_select "input[name=?]", "stock[size]"

      assert_select "input[name=?]", "stock[amount]"

      assert_select "input[name=?]", "stock[product_id]"
    end
  end
end
