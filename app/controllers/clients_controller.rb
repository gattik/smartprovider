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
		@client.save
		@current_user.clients << @client

		redirect_to clients_path
	end

	def show
		@client = Client.find(params[:id])
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



	private

	def client_params
		params.require(:client).permit(:first_name, :last_name, :date_of_birth, :gender, :hcn, :physician, :physician_phone, :diagnosis, :advanced_directives, :address, :contact_name, :contact_phone, :contact_relationship)
	end
end 