require 'rails_helper'

RSpec.describe "admin/categories/index", type: :view do
  before(:each) do
    assign(:admin_categories, [
      Admin::Category.create!(
        name: "Name",
        description: "MyText"
      ),
      Admin::Category.create!(
        name: "Name",
        description: "MyText"
      )
    ])
  end

  it "renders a list of admin/categories" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
  end
end
