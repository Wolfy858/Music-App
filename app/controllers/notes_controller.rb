class NotesController < ApplicationController

  def create
    @note = Note.new(note_params)
    @note.author = current_user

    if @note.save
      redirect_to track_path(@note.track)
    else
      @track = @note.track
      render "tracks/show"
    end
  end

  def destroy
    @note = Note.find(params[:id])
    track = @note.track
    if current_user == @note.author
      @note.destroy
    else
      flash[:errors]="403 Status: FORBIDDEN"
    end
    redirect_to track_path(track)
  end

  def note_params
    params.require(:note).permit(:content, :track_id)
  end

end
