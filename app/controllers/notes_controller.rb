class NotesController < ApplicationController

  def new
    @note = Note.new
    render :new
  end

  def show
    @note = Note.find(params[:id])
    render :show
  end

  def create
    @note = Note.new(note_params)
    @note.user_id = current_user.id
    if @note.save
      redirect_to track_url
    else
      flash.now[:errors] = @note.errors.full_messages
      render :new
    end
  end

  def edit

  end

  def update
  end

  def destroy
  end

  private
  def note_params
    params.require(:note).permit(:review, :user_id, :track_id)
  end
end
