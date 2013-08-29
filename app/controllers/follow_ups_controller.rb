class FollowUpsController < ApplicationController

  before_action :require_current_user

  respond_to :json

  def index
    @follow_ups = FollowUp.all
  end

  def new
    @follow_up = FollowUp.new
  end

  def create
    @follow_up = FollowUp.new(follow_up_params)
    @follow_up.note = Note.find(params[:note_id])
    @follow_up.user = User.find(params[:user_id])
    if @follow_up.save
      flash[:notice] = "Follow up successfully assigned."
      redirect_to client_path(@follow_up.note.client_id)
    else
      flash[:error] = "Follow up failed!"
      redirect_to client_path(@follow_up.note.client_id)
    end
  end

  def show
  end

  def complete
    task = FollowUp.find(params[:id])
    task.completed = true
    if task.save    
      respond_with task
    end
  end

  private

  def follow_up_params
    params.require(:follow_up).permit(:task, :completed)
  end

end
