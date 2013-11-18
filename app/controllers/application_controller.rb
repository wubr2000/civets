class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  
  before_filter :make_action_mailer_use_request_host_and_protocol
  
  def current_user
    @current_user ||= User.where(id: session[:user_id]).take 
  end
  
  def is_authenticated?
    redirect_to login_url unless current_user
  end
  
  protected
  
  def log_user_in(user, message = nil)
    session[:user_id] = user.id
    redirect_to root_url, notice: message
  end
  
  def set_csrf_token_header
    response.headers['X-CSRF-Token'] = form_authenticity_token
  end
  
  private

  def make_action_mailer_use_request_host_and_protocol
    ActionMailer::Base.default_url_options[:protocol] = request.protocol
    ActionMailer::Base.default_url_options[:host] = request.host_with_port
  end
end
