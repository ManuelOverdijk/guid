require 'spec_helper'

feature 'Token management' do

	background do
      @agent = create(:user,:agent)
      activate(@agent)
	  	login(@agent)
    end

	scenario "adds a token" do
		
		token = create(:token)

	end
end