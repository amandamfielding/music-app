class TracksController < ApplicationController

  def index
    @tracks = Track.all
    render :index
  end

  def new
    @track = Track.new
    render :new
  end

  def show
    @track = Track.find(params[:id])
    render :show
  end

  def create
    @track = Track.new(track_params)
    if @track.save
      redirect_to album_url(@track.album.id)
    else
      flash.now[:errors] = @track.errors.full_messages
      render :new
    end
  end

  def edit
    @track = Track.find(params[:id])
  end

  def update
    @track = Track.find(params[:id])
    if @track.update_attributes(track_params)
      redirect_to track_url
    else
      flash.now[:errors] = @track.errors.full_messages
      render :edit
    end
  end

  def destroy
  end

  private
  def track_params
    params.require(:track).permit(:album_id, :name, :lyrics, :category)
  end
end
