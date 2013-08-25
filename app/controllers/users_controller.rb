class UsersController < ApplicationController

  before_action :require_current_user, except: [:new, :create]

  def index
  	@users = User.all
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
      respond_to do |format|
        UserMailer.welcome_email(@user).deliver
        format.html { redirect_to login_path }
        format.js 
      end
    else
      respond_to do |format|
        format.html { render action: :new }
        format.js
      end
    end
  end

  def show
  	@user = User.find(params[:id])
    unless @user == @current_user
      redirect_to user_path(@current_user)
    end
  end

  def edit
    @user = User.find(params[:id])
    unless @user == @current_user
      redirect_to edit_user_path(@current_user)
    end
  end
  
  def update
  	@user = User.find(params[:id])
  	@user.update(user_params)
  	redirect_to user_path(@user)
  end

  def destroy
  	@user = User.find(params[:id])
  	@user.destroy
  	redirect_to new_user_path
  end

private

  def user_params
  	params.require(:user).permit(:first_name, :last_name, :designation, :phone, :email, :password, :password_confirmation, :username)
  end

end
