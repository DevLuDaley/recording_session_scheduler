class ArtistsController < ApplicationController
    # before_filter :authenticate_user!
    before_action :authenticate_user!

  def index
    @artists = Artist.all
    @recording_sessions = RecordingSession.all
    @engineers = Engineer.all
    @studios = Studio.all
    #@artists = Artist.all
  end

  def new
    @artist = Artist.new
  end


  def create
      # binding.pry
      @artist = Artist.new(artist_params)
  #    @artist = Artist.new(params[:name]
      #index
      # @artist = Artist.find(params[:id])
      if @artist.save
        # raise params.inspect
  #      redirect_to action: 'index' # , notice: 'Artist created'
        redirect_to @artist # , notice: 'Artist created'
      else
        # @studios = Studio.all
        render action: 'new'
      end
  end

  def edit
    @artist = Artist.find(params[:id])
 #   index
  end

def update
    index
    #binding.pry
    @artist = Artist.find(params[:id])
    # raise params.inspect
    if @artist.update(params.require(:artist).permit(:name))
      # binding.pry
      redirect_to artist_path(@artist)

    else
      render 'edit'
  end
end



def show
    index
    # binding.pry
    @artist = Artist.find(params[:id])
    #     redirect_to action: 'index'
    
  end

private
  def artist_params
    params.require(:artist).permit(:name)
  end


end
