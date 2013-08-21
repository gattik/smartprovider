class VitalsController < ApplicationController

  before_action :require_current_user

  def index
    @client = Client.find(params[:client_id])

    @vital = @client.vitals #Vital.find(params[:id])
  end

  def new
  	@vital = Vital.new
    @client = Client.find(params[:client_id])
  end

  def create
    @vital = Vital.new(vital_params)
    @vital.client = Client.find(params[:client_id])
    @vital.save

    redirect_to client_path(@vital.client)
  end

  def show
  	@vital = Vital.find(params[:id])
  end

  # def edit
  # end

  # def update
  # end

  # def destroy
  # end

private

  def vital_params
  	params.require(:vital).permit(:weight, :height, :systolic, :diastolic, :beats, :beats_location, :beats_condition, :blood_sugar, :bs_condition, :breaths, :breaths_condition, :breaths_description, :temperature, :client_id, :user_id)
  end
end
