class VitalsController < ApplicationController
	class NotesController < ApplicationController

  before_action :require_current_user

  def index
    @vitals = Vital.all
  end

  def new
  	@vital = Vital.new
  end

  def create
    @vital = Vital.new(note_params)
    @vital.client = Client.find(params[:client_id])
    @vital.user = @current_user
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
  	params.require(:vital).permit(:weight, :height, :systolic, :diastolic, :beats, :beats_location, :beats_condition, :blood_sugar, :bs_condition, :breaths, :breaths_condition, :breaths_description, :temperature, :temp_description, :client_id, :user_id)
  end
end
end
