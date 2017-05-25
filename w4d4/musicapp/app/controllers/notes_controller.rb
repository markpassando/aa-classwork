class NotesController < ApplicationController

  before_action :require_user!

  def index
    @notes = Note.all
    render :index
  end

  def new
    @notes = Album.all
    @note_id = params[:album_id]
    render :new
  end

  def show
    @note = Note.find(params[:id])

    if @note
      render :show
    else
      render :new
    end
  end

  def create
    #debugger
    #note_params[:user_id] = current_user.id
    @note = current_user.notes.new(note_params)

    if @note.save
      #debugger
      redirect_to track_url(note_params[:track_id])
    else
      flash.now[:errors] = ["Body Can Not Be Empty"]
      redirect_to track_url(note_params[:track_id])
    end
  end

  def destroy
    band = Note.find(params[:id])
    if band
      band.destroy
      redirect_to bands_url
    end

  end

  def note_params
    params.require(:note).permit(:user_id, :track_id, :body)
  end
end
