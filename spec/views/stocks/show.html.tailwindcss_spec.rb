# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "stocks/show", type: :view do
  before(:each) do
    assign(:stock, Stock.create!(
      size: 2,
      amount: 3,
      product: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(//)
  end
end
