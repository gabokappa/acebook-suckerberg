# frozen_string_literal: true
require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    describe 'GET /index ' do
        login_user
        it 'responds with 200' do
          get :index
          expect(response).to have_http_status(200)
        end
    end
    # test to create with a a profile picutre?
    #
    # describe "GET /show" do
    #     it "displays the users wall" do
    #         new_user = FactoryBot.create(:user)

    #         login_as(new_user, scope: :new_user)
    #          userswall_path
    #         page.should have_content(user.email)
    #     end
    # end
end
