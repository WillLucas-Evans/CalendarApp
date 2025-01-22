class RegistrationsController < ApplicationController
  allow_unauthenticated_access

  def new
    redirect_to "/calendar" if authenticated?

    @registration = Registration.new
  end

  def create
    @registration = Registration.new(registration_params)
    if user = @registration.save
      start_new_session_for user

      redirect_to root_url
    else
      redirect_to new_registrations_path
    end
  end

private

  def registration_params
    params.expect(registration: [ :email_address, :password ])
  end
end
