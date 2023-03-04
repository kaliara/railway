class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_instant_login_token(params[:token])
    sign_in @user if @user

    redirect_to edit_reservation_path
  end
end