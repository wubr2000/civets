class PasswordReset
  RESET_MESSAGE = %{
    An email with instructions for resetting your password
    has been sent to you.
  }.squish
  
  ERROR_MESSAGE = "Unable to reset your password. Check your passwords and try again."
  
  def initialize(user, messages = {})
    @user = user
    @messages = messages
  end
  
  def send_password_reset
    @user.set_password_reset

    if Notifier.password_reset_request(@user).deliver
      @messages[:notice] = RESET_MESSAGE
    else
      @messages[:error] = ERROR_MESSAGE
    end
  end
  
  def reset_password(params)
    if @user.reset_password(password_params(params))
      Notifier.password_reset(@user).deliver
      true
    end
  end
  
  private

  def password_params(params)
    params.require(:user).permit( :password, :password_confirmation )
  end
end