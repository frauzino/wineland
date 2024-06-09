require 'rails_helper'

RSpec.describe "markets/edit", type: :view do
  let(:market) {
    Market.create!(
      name: "MyString",
      description: "MyText",
      address: "MyString"
    )
  }

  before(:each) do
    assign(:market, market)
  end

  it "renders the edit market form" do
    render

    assert_select "form[action=?][method=?]", market_path(market), "post" do

      assert_select "input[name=?]", "market[name]"

      assert_select "textarea[name=?]", "market[description]"

      assert_select "input[name=?]", "market[address]"
    end
  end
end
