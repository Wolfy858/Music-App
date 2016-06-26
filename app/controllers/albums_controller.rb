class AlbumsController < ApplicationController

  def new
    @band = Band.find(params[:band_id])
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)

    if @album.save
      redirect_to album_path(@album)
    else
      @band = @album.band
      render "new"
    end
  end

  def show
    @album = Album.find(params[:id])
  end

  def album_params
    params.require(:album).permit(:title, :band_id, :category, :year)
  end

end
