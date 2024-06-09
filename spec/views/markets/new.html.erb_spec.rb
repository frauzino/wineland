require 'rails_helper'

RSpec.describe "markets/new", type: :view do
  before(:each) do
    assign(:market, Market.new(
      name: "MyString",
      description: "MyText",
      address: "MyString"
    ))
  end

  it "renders new market form" do
    render

    assert_select "form[action=?][method=?]", markets_path, "post" do

      assert_select "input[name=?]", "market[name]"

      assert_select "textarea[name=?]", "market[description]"

      assert_select "input[name=?]", "market[address]"
    end
  end
end
