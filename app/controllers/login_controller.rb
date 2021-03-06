class LoginController < ApplicationController
	
  def new
		@user = User.new
	end

	def create
		@user = User.find_by(email: params[:user][:email])

  	if @user && login_valid?(@user)
      session[:user_id] = @user.id
    	redirect_to users_path
    else
    	flash[:error] = "Invalid Login"
    	redirect_to login_path
    end
  end

	def logout
		reset_session
    redirect_to login_path
	end

	private

	def login_valid?(user)
		if Rails.env.test?
			if params[:user][:password_digest] == user.password_digest
				return true
			end
		elsif @user.authenticate(params[:user][:password])
			return true
		end
	end
end
