class FollowUpsController < ApplicationController

  before_action :require_current_user

  def index
    @follow_ups = FollowUp.all
    # @current_user_follow_ups = @follow_ups.find_by assigned_user_id: @current_user.id
  end

  def new
    @follow_up = FollowUp.new
  end

  def create
    @client = Client.find(params[:id])
    @follow_up = FollowUp.new(follow_up_params)
    @follow_up.note = Note.find(params[:note_id])
    @follow_up.save
    redirect_to client_path(@client)
  end

  def update
    @follow_up = FollowUp.find(params[:id])
    @follow_up.update(follow_up_params)
    redirect_to client_path(@follow_up.note.client_id)
  end

  private

  def follow_up_params
    params.require(:follow_up).permit(:task, :assigned_user_id, :completed)
  end

end
