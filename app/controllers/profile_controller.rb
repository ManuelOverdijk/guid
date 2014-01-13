class ProfileController < ApplicationController
  def show
    auth_required
    access_only_with_roles("agent")
  end
end
