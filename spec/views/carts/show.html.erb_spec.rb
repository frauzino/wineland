require 'rails_helper'

RSpec.describe "carts/show", type: :view do
  before(:each) do
    assign(:cart, Cart.create!(
      total_price: 2.5,
      user: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(//)
  end
end
