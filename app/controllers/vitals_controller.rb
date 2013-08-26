class VitalsController < ApplicationController

  before_action :require_current_user

  def index
    @vitals = Vital.all #Vital.find(params[:id])
    @client = Client.find(params[:client_id])
  end

  def new
  	@vital = Vital.new
    @client = Client.find(params[:client_id])
  end

  def create
    @vital = Vital.new(vital_params)
    @vital.client = Client.find(params[:client_id])
    if @vital.save
      flash[:notice] = "Vitals successfully created."
    else
      flash[:error] = "Error. Must enter at least one value."
    end
    redirect_to new_client_vital_path(@vital.client)
  end

  def show
  	@client = Client.find(params[:client_id])
    @vital = @client.vitals
  end

  # def edit
  # end

  # def update
  # end

  # def destroy
  # end

private

  def vital_params
  	params.require(:vital).permit(:weight, :height, :systolic, :diastolic, :beats, :beats_location, :beats_condition, :blood_sugar, :bs_condition, :breaths, :breaths_condition, :breaths_description, :temperature, :client_id)
  end
end
