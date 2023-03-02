class HomeController < ApplicationController
  def index
    if current_user
      @user = current_user
      @reservation = @user.reservation if @user
    else
      @session = Passwordless::Session.new
    end
  end
end