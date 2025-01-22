class RegistrationsController < ApplicationController
  allow_unauthenticated_access

  def new
    redirect_to events_path if authenticated?

    @user = User.new
  end
end
