require 'rails_helper'

RSpec.describe "retailers/edit", type: :view do
  let(:retailer) {
    Retailer.create!(
      name: "MyString",
      address: "MyString"
    )
  }

  before(:each) do
    assign(:retailer, retailer)
  end

  it "renders the edit retailer form" do
    render

    assert_select "form[action=?][method=?]", retailer_path(retailer), "post" do

      assert_select "input[name=?]", "retailer[name]"

      assert_select "input[name=?]", "retailer[address]"
    end
  end
end
