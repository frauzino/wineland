require 'rails_helper'

RSpec.describe "markets/index", type: :view do
  before(:each) do
    assign(:markets, [
      Market.create!(
        name: "Name",
        description: "MyText",
        address: "Address"
      ),
      Market.create!(
        name: "Name",
        description: "MyText",
        address: "Address"
      )
    ])
  end

  it "renders a list of markets" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Address".to_s), count: 2
  end
end
