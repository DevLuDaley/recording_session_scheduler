class RecordingSessionsController < ApplicationController
    before_action :authenticate_user!

  def index
    @recording_sessions = RecordingSession.all
    #calling 'index'miltiple times because of select (@artists) method in recoriding_session_controller#new
    @engineers = Engineer.all
    @studios = Studio.all
    @artists = Artist.all
#@recording_session_boom = RecordingSession.boom
@recording_sessions_by_status_then_date = RecordingSession.all.incomplete.order('appointment_date ASC')

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
    index
#if params[:artist_id]
             #redirect_to action: 'index'
    #  @recording_session.artist_id = Artist.find(params[:artist_id])
#    @recording_sessions_incomplete_by_date = RecordingSession.incomplete.order('appointment_date ASC')

    @recording_session = RecordingSession.new(recording_session_params)
    if params[:artist_id] != nil
      @artist = Artist.find(params[:artist_id])
      @recording_session.artist_id = @artist.id
      #binding.pry
    #else
    # @recording_session = RecordingSession.find(params[:id])
   # @recording_sessions = artist.recording_sessions.create(recording_sessions_params)
#  binding.pry
  #binding.pry
   end
   if @recording_session.save
    # raise params.inspect
#      redirect_to action: 'index' # , notice: 'Recording Session created'
      redirect_to @recording_session
      flash.notice = "Recording Session created for #{@recording_session.artist.name.capitalize}"
    else
      # @studios = Studio.all
      render action: 'new'
      flash.alert = "Sorry we couldn't create a session for you."
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

  def destroy
    RecordingSession.find(params[:id]).destroy
    redirect_to action: 'index'
    #redirect_to recording_session_path
  end

  def show_studios
    @studio = Studio.find(params[:id])
  end
#end

#def create_artist_from_name
 # self.artist_name = new_artist_name if not new_artist_name.blank?
#end


def past_sessions
  @recording_sessions_past_true = RecordingSession.all.past_true
end

private
def recording_session_params
  params.require(:recording_session).permit(:appointment_date, :studio_id, :engineer_id, :artist_id, :status)
end

# def artist_params
#   params.require(:artist).permit(:artist_id, :name) #, :artist_created_name)
# end

end
