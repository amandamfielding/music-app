class AlbumsController < ApplicationController

  def index
    @albums = Album.all
    render :index
  end

  def new
    @album = Album.new
    render :new
  end

  def show
    @album = Album.find(params[:id])
    render :show
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to band_url(@album.band.id)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :new
    end
  end

  def update
  end

  def destroy
  end

  private
  def album_params
    params.require(:album).permit(:band_id, :name, :source)
  end
end
