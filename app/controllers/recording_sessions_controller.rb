class RecordingSessionsController < ApplicationController
    #before_filter :authenticate_user!
    before_action :authenticate_user!
#http_basic_authenticate_with name: "lu", password: "password", except: [:index, :show]
class Project < ActiveRecord::Base
  belongs_to :artist, :class_name => 'Artist'
  accepts_nested_attributes_for :artist, :reject_if => :all_blank
end

  def index
    @recording_sessions = RecordingSession.all
    #calling 'index'miltiple times because of select (@artists) method in recoriding_session_controller#new
    @engineers = Engineer.all
    @studios = Studio.all
    @artists = Artist.all

    #binding.pry
    if params[:artist_id]
      @recording_sessions = Artist.find(params[:artist_id]).recording_sessions
 #     @artist = Artist.find_by(id: params[:artist_id])
#  if @artist.nil?
#   redirect_to artists_path, alert: "Artist not found"
#  else
#   @recording_sessions = @artist.recording_sessions 
    elsif params[:engineer_id]
      @recording_sessions = Engineer.find(params[:engineer_id]).recording_sessions
    elsif params[:studio_id]
      @recording_sessions = Studio.find(params[:studio_id]).recording_sessions
    else
     
   #    redirect_to action: 'index'
         end
  end 


  def show
    index
    @recording_session = RecordingSession.find(params[:id])
   # binding.pry
    #     redirect_to action: 'index'
    
  end

  def new
    index
    #if params[:artist_id]
          # redirect_to action: 'index'

    #else
  #    @recording_session.artist.id = Artist.find(params[:artist_id])
    @recording_session = RecordingSession.new#(params[:id])
    @artist = Artist.new(params[:id])

      
   # end
    #@artist = Artist.find(params[:artist_id]
    #RecordingSession.artists.build
    #@recording_session.artist_name = params[:artist_created_name] unless params[:artist_created_name].empty
    # params.require(:recording_session).permit(:appointment_date, :studio_id, :engineer_id, :artist_id)
    # if artist_id or not -- that
    # if nested_--tind artist build --what is associated
  end

  def create
    # binding.pry
    index
#if params[:artist_id]
             #redirect_to action: 'index'

    #  @recording_session.artist_id = Artist.find(params[:artist_id])
    @recording_session = RecordingSession.new(recording_session_params)
    # @recording_session = RecordingSession.find(params[:id])
   # @recording_sessions = artist.recording_sessions.create(recording_sessions_params)
   if @recording_session.save
    # raise params.inspect
 # end
#      redirect_to action: 'index' # , notice: 'Recording Session created'
      redirect_to @recording_session # , notice: 'Recording Session created'
    else
      # @studios = Studio.all
      render action: 'new'
    end
  end

  def edit
    index
    @recording_session = RecordingSession.find(params[:id])
  if params[:artist_id]
      @recording_sessions = Artist.find(params[:artist_id]).recording_sessions
 #     @artist = Artist.find_by(id: params[:artist_id])
#  if @artist.nil?
#   redirect_to artists_path, alert: "Artist not found"
#  else
#   @recording_sessions = @artist.recording_sessions 
    elsif params[:engineer_id]
      @recording_sessions = Engineer.find(params[:engineer_id]).recording_sessions
    elsif params[:studio_id]
      @recording_sessions = Studio.find(params[:studio_id]).recording_sessions
    else
      @recording_sessions = RecordingSession.all
   #    redirect_to action: 'index'
         end
  end

  #   def recording_session_param
  #     params.require(:recording_session).permit(:appointment_date, :studio_id, :engineer_id, :artist_id)
  #   end

  # def update
  # @recording_session = recording_session.find(params[:id])
  # @recording_session.update(params.require(:recording_session).permit(:appointment_date, :studio, :engineer, :artist)
  # raise params.inspect
  # if @recording_session.update_attributes(recording_session_param)
  #    redirect_to action: 'show', id: @recording_session
  #  else

  #    @recording_sessions = RecordingSession.all
  #    @engineers = Engineer.all
  #    @engineer = Engineer.find(params[:id])
  #    @studios = Studio.all
  #    @artists = Artist.all
  #    render action: 'edit'
  # end
  # end

  def update
    index
    @recording_session = RecordingSession.find(params[:id])
    # raise params.inspect
    if @recording_session.update(params.require(:recording_session).permit(:appointment_date, :studio_id, :engineer_id, :artist_id, :status))
      # binding.pry
      redirect_to recording_session_path(@recording_session)

    else
      render 'edit'
  end
  end

  #   def update
  #     @recording_session = RecordingSession.find(params[:id])
  #     #@recording_session.update(params.require(:recording_session).permit(:appointment_date, :studio, :engineer, :artist)
  #     raise params.inspect
  #     if @recording_session.update_attributes(recording_session_param)
  #       redirect_to action: 'show', id: @recording_session
  #     else

  #       @recording_sessions = RecordingSession.all
  #       @engineers = Engineer.all
  #       @engineer = Engineer.find(params[:id])
  #       @studios = Studio.all
  #       @artists = Artist.all
  #       render action: 'edit'
  #     end
  #   end

  def destroy
    RecordingSession.find(params[:id]).destroy
    redirect_to action: 'index'
    #redirect_to recording_session_path
  end

  def show_studios
    @studio = Studio.find(params[:id])
  end
#end

def create_artist_from_name
  self.artist_name = new_artist_name if not new_artist_name.blank?
end
private

def recording_session_params
  params.require(:recording_session).permit(:appointment_date, :studio_id, :engineer_id, :artist_id, :status)
end

# def artist_params
#   params.require(:artist).permit(:artist_id, :name) #, :artist_created_name)
# end





end
