class TracksController < ApplicationController

  def new
    @album = Album.find(params[:album_id])
    @track = Track.new
  end

  def create
    @track = Track.new(track_params)

    if @track.save
      redirect_to track_path(@track)
    else
      @album = @track.album
      render "new"
    end
  end

  def show
    @track = Track.find(params[:id])
  end

  def edit
    @track = Track.find(params[:id])
    @album = @track.album
  end

  def update
    @track = Track.find(params[:id])

    if @track.update(track_params)
      redirect_to track_path(@track)
    else
      @album = @track.album
      render "edit"
    end
  end

  def destroy
    @track = Track.find(params[:id])
    album = @track.album
    @track.destroy
    redirect_to album_path(album)
  end


  def track_params
    params.require(:track).permit(:title, :album_id, :category, :track_number, :lyrics)
  end

end
