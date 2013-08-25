class ClientsController < ApplicationController

	before_action :require_current_user

	def index
		@clients = Client.all 
	end

	def new
		@client = Client.new
	end

	def create
		@client = Client.new(client_params)
		if @client.save
			@current_user.clients << @client
			redirect_to clients_path
		else
			render action: :new
		end
	end

	def show
		@client = Client.find(params[:id])
		@users = User.all
		@json = @client.to_gmaps4rails
	end

	def add_user_to
		@client = Client.find(params[:id])
		@selected_user = User.find(params[:user_id])
		if @client.users.include? @selected_user
			flash[:error] = "Client already has user!"
		else
		  @client.users << @selected_user
		end
		redirect_to client_path(@client)
	end

	def edit
		@client = Client.find(params[:id])
   	@client.save
	end

	def update
		@client = Client.find(params[:id])
		@client.update(client_params)

		redirect_to clients_path
	end

	def destroy
		@client = Client.find(params[:id])
		@client.destroy
		redirect_to clients_path
	end

	def remove_user_from_client
	end

	private

	def client_params
		params.require(:client).permit(:first_name, :last_name, :date_of_birth, :gender, :hcn, :physician, :physician_phone, :diagnosis, :advanced_directives, :street, :city, :province, :contact_name, :contact_phone, :contact_relationship, :image, :latitude, :longitude, :gmaps)
	end
end 