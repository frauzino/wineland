require 'rails_helper'

RSpec.describe "retailers/index", type: :view do
  before(:each) do
    assign(:retailers, [
      Retailer.create!(
        name: "Name",
        address: "Address"
      ),
      Retailer.create!(
        name: "Name",
        address: "Address"
      )
    ])
  end

  it "renders a list of retailers" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Address".to_s), count: 2
  end
end
