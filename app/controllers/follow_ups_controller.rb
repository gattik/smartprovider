class FollowUpsController < ApplicationController

  before_action :require_current_user

  def index
    @follow_ups = FollowUp.all
  end

  def new
    @follow_up = FollowUp.new
  end

  def create
    @client = Client.find(params[:client_id])
    @follow_up = FollowUp.new(follow_up_params)
    @follow_up.note = Note.find(params[:note_id])
    @follow_up.user_id = @current_user.id
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

  def current_user_follow_ups
    @follow_ups.each do |follow_up|
      @current_user_follow_ups = []
      if follow_up.assigned_user_id == @current_user.id
        @current_user_follow_ups << follow_up
      end
    end
  end

end
