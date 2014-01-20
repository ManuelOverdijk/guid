require 'spec_helper'

describe TokensController do

	describe 'POST #create' do
		describe "with valid attributes" do
			it "saves the generated string in the db" do
				expect{
					post :create, token: attributes_for(:token)
				}.to change(Token, :count).by(1)	
			end
		end

		describe "with invalid attributes" do
			it "does not save the generated string in the db" do
				expect{
					post :create, token: attributes_for(:invalid_token)
				}.to_not change(Token, :count)
			end
		end
	end


  describe "guest access" do

		describe "POST #create" do
			it "requires login" do
				post :create, id: create(:token),
					token: attributes_for(:token)
				expect(response).to redirect_to new_url
			end
		end
	end
end
