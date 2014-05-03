class WelcomeController < ApplicationController
  
before_action :redirect_if_logged_in

  def index
    @seats = Seat.all
  end

  private

  def user_signed_in?
  end

  def redirect_if_logged_in
    if user_signed_in?
      redirect_to users_path
  end

end

end
