require 'spec_helper'

describe "Generate page" do
 	it "should have the content Generate" do
 		visit '/static_pages/generate'
 		expect(page).to have_content('Generate')
 	end
 end

 describe "Private page" do
 	it "should have the content Private" do
 		visit '/static_pages/private'
 		expect(page).to have_content('Private')
 	end
 end

