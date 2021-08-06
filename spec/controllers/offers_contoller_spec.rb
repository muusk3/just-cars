require 'rails_helper'

RSpec.describe OffersController, type: :controller do
  let!(:offers)   { create_list(:offer, 5) }
  let(:authorize) { request.headers["Authorization"] = "ihiyvBJ0wW2oK8-HO6bC-Ag" }

  describe 'GET index' do
    before do
      routes.draw { get "index" => "offers#index" }
    end

    context "valid Authorization header" do
      it "returns a 200" do
        authorize
        get :index

        expect(response).to have_http_status(:ok)
      end
    end

    context "invalid Authorization header" do
      it "returns a 401" do
        request.headers["Authorization"] = ""
        get :index

        expect(response).to have_http_status(:unauthorized)
      end
    end

    context "returns Offer list" do
      it "with 5 items" do
        authorize
        get :index

        expect(response.parsed_body['data'].length).to eq(5)
      end
    end
  end

  describe 'GET show' do
    before do
      routes.draw { get "show" => "offers#show" }
    end

    it "returns Offer" do
      authorize
      get :show, params: { id: offers.first.id  }

      expect(response.parsed_body['data'].length).to eq(1)
    end
  end
end
