class ArtistsController < ApplicationController
    # before_filter :authenticate_user!
    before_action :authenticate_user!

  def index
    @artists = Artist.all
    @recording_sessions = RecordingSession.all
    @engineers = Engineer.all
    @studios = Studio.all
    #@artists = Artist.all
        respond_to do |f|
        f.html {render :index} 
        f.json {render json: @artists}
        end
  end

def show
    index
    # binding.pry
    @artist = Artist.find(params[:id])
    #     redirect_to action: 'index'
      respond_to do |f|
        f.html {render :show} 
        f.json {render json: @artist}
      end
  end


  def new
    @artist = Artist.new
#    2.times {@artist.recording_sessions.build}

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
        #redirect_to @artist # , notice: 'Artist created'

         respond_to do |f|
        f.html {redirect_to artist_path} 
        f.json {render json: @artist}
      end
      else
        # @studios = Studio.all
        #render action: 'new'
        render :new
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
    if @artist.update(params.require(:artist).permit(:name, :email))
      # binding.pry
      redirect_to artist_path(@artist)

    else
      render 'edit'
  end
end






  def destroy
    Artist.find(params[:id]).destroy
    redirect_to action: 'index'
    #redirect_to recording_session_path
  end



  private
    def artist_params
      params.require(:artist).permit(:name, :email, recording_session_ids:[], recording_session_attributes: [:artist_id, :engineer_id, :studio_id, :appointment_date])
    end


end
