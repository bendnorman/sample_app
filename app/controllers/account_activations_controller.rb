class AccountActivationsController < ApplicationController
  def edit
    user = User.find_by(email: params[:email])
    if user && !user.activated?
      user.activate
      log_in user
      flash[:success] = "account Activated!"
      redirect_to user
    else
      flash[:danger] = "invalid activation link"
      redirect_to root_url
    end
  end
end
