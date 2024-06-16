# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "stocks/edit", type: :view do
  let(:stock) {
    Stock.create!(
      size: 1,
      amount: 1,
      product: nil
    )
  }

  before(:each) do
    assign(:stock, stock)
  end

  it "renders the edit stock form" do
    render

    assert_select "form[action=?][method=?]", stock_path(stock), "post" do

      assert_select "input[name=?]", "stock[size]"

      assert_select "input[name=?]", "stock[amount]"

      assert_select "input[name=?]", "stock[product_id]"
    end
  end
end
