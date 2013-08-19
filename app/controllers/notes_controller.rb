class NotesController < ApplicationController

  before_action :require_current_user

  def index
    @notes = Note.all
  end

  def new
  	@note = Note.new
  end

  def create
    @note = Note.new(note_params)
    # @note.client = Client.find(params[:client_id])
    @note.user = @current_user
    @note.save

    redirect_to client_path(@note.client)
  end

  def show
  	@note = Note.find(params[:id])
  end

  # def edit
  # end

  # def update
  # end

  # def destroy
  # end

private

  def note_params
  	params.require(:note).permit(:title, :description, :client_id, :importance )
  end
end
