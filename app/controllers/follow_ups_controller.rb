class FollowUpsController < ApplicationController

  def index
  end

  def new
    @follow_up = FollowUp.new
  end

  def create
    @follow_up = FollowUp.new(params[:follow_up_params])
    @follow_up.note = Note.find(params[:note_id])
    @follow_up.save
    redirect_to client_path(@follow_up.note.client_id)
  end

  def update
    @follow_up = FollowUp.find(params[:id])
    @follow_up.update(follow_up_params)
    redirect_to client_path(@follow_up.note.client_id)
  end

  private

  def follow_up_params
    params.require(:follow_up).permit(:task, :assigned_user)
  end

end
