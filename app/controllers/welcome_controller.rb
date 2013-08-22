class WelcomeController < ApplicationController
	before_action :require_current_user
	def index
		session[:user_id] = nil
	end
end
