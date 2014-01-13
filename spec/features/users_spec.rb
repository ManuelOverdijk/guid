require 'spec_helper'

  feature 'User Management', %q{
    As the site owner
    I want to provide an user management
    so that I can protect functions and grant access based on roles
  } do

    background do
      @agent = create(:user,:agent)
    end

    scenario 'Sign up' do
      #visit new_session_path
      #click_link 'Sign Up'
      #fill_in 'user[email]', with: 'newagent@example.com'
      #fill_in 'user[password]', with: 'newpassword'
      #fill_in 'user[password_confirmation]', with: 'newpassword'
      #click_button 'Submit'
      #expect(page).to have_content "Sign up complete. Please check your inbox for activation email."
    end

    scenario 'Real estate agent activation' do
      activate(@agent)
      expect(page).to have_content "Activation complete. Welcome #{@agent.email}"
    end

    scenario 'User log in' do
      activate(@agent)
      login(@agent)
      expect(page).to have_content "Successfully logged in."
    end

    scenario 'User log out' do
      activate(@agent)
      login(@agent)
      logout(@agent)
      expect(page).to have_content "Successfully logged out."
    end

    scenario 'Inactive User are not able to login' do
      login(@agent)
      expect(page).to have_content "Account inactive. Please activate your account."
    end

    scenario 'Agents have access to their profile page' do
      activate(@agent)
      login(@agent)
      visit profile_path
      expect(page).to have_content "Welcome to your profile, #{@agent.email}"
    end

    scenario 'Visitors dont have access to any profile' do
      visit profile_path
      expect(page).to have_content "This site is protected. Please log in first."
    end

    scenario 'Users with no agent role dont have profile access' do
      @agent.destroy
      @noagent = create(:user,:no_agent)
      activate(@noagent)
      login(@noagent)
      visit profile_path
      expect(page).to have_content "Access denied. Insufficent rights."
    end

  end