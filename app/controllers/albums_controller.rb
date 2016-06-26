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

  def edit
    @album = Album.find(params[:id])
    @band = @album.band
  end

  def update
    @album = Album.find(params[:id])

    if @album.update(album_params)
      redirect_to album_path(@album)
    else
      @band = @album.band
      render "edit"
    end
  end

  def destroy
    @album = Album.find(params[:id])
    band = @album.band
    @album.destroy
    redirect_to band_path(band)
  end

  def album_params
    params.require(:album).permit(:title, :band_id, :category, :year)
  end

end
