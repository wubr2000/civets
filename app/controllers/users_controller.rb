class UsersController < ApplicationController
  before_action :get_registrant
  
  def new
    @user = User.new
  end
  
  def create
    @user = UserRegistration.new.register_new_user(@registrant, params)
    
    if @user.valid?
      log_user_in(user, "Thank you for registering!")
    else
      flash.now[:error] = @user.errors
      render :new
    end
  end
  
  private
  
  def get_registrant
    unless @registrant = Registrant.find_by_code(params[:code])
      redirect_to login_url, error: "Sorry, your code has expired. Please try again."
    end
  end
end
