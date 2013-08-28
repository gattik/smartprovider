class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def set_current_user
  	if session[:user_id]
  		@current_user = User.find(session[:user_id])
  	end
  end

  def require_current_user
  	set_current_user
  	redirect_to root_path unless @current_user
  end

  def current_user_clients_gmaps
    @user_clients = @current_user.clients.to_gmaps4rails
  end

end
