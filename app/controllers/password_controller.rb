class PasswordController < ApplicationController
  before_action :get_user
  
  def edit
  end
  
  def update
    PasswordReset.new(@user).reset_password(params)
    
    if @user.valid?
      log_user_in(user, "Your password has been updated.")
    else
      flash.now[:error] = @user.errors
      render :edit
    end
  end
  
  private
  
  def get_user
    unless @user = User.find_by_code(params[:code])
      redirect_to login_url, error: "Sorry, your code has expired. Please try again."
    end
  end
end