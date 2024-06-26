require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/markets", type: :request do
  
  # This should return the minimal set of attributes required to create a valid
  # Market. As you add validations to Market, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Market.create! valid_attributes
      get markets_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      market = Market.create! valid_attributes
      get market_url(market)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_market_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      market = Market.create! valid_attributes
      get edit_market_url(market)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Market" do
        expect {
          post markets_url, params: { market: valid_attributes }
        }.to change(Market, :count).by(1)
      end

      it "redirects to the created market" do
        post markets_url, params: { market: valid_attributes }
        expect(response).to redirect_to(market_url(Market.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Market" do
        expect {
          post markets_url, params: { market: invalid_attributes }
        }.to change(Market, :count).by(0)
      end

    
      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post markets_url, params: { market: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested market" do
        market = Market.create! valid_attributes
        patch market_url(market), params: { market: new_attributes }
        market.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the market" do
        market = Market.create! valid_attributes
        patch market_url(market), params: { market: new_attributes }
        market.reload
        expect(response).to redirect_to(market_url(market))
      end
    end

    context "with invalid parameters" do
    
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        market = Market.create! valid_attributes
        patch market_url(market), params: { market: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested market" do
      market = Market.create! valid_attributes
      expect {
        delete market_url(market)
      }.to change(Market, :count).by(-1)
    end

    it "redirects to the markets list" do
      market = Market.create! valid_attributes
      delete market_url(market)
      expect(response).to redirect_to(markets_url)
    end
  end
end
