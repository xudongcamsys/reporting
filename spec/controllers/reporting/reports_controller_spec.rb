require 'rails_helper'

module Reporting
  RSpec.describe ReportsController, type: :controller do
    routes { Reporting::Engine.routes }

    describe "GET #index" do
      it "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
      end
    end

  end
end
