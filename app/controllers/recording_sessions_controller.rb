class RecordingSessionsController < ApplicationController
    #before_filter :authenticate_user!
    before_action :authenticate_user!
#http_basic_authenticate_with name: "lu", password: "password", except: [:index, :show]


  def index
    @engineers = Engineer.all
    @studios = Studio.all
    @artists = Artist.all
    if params[:artist_id]
      @recording_sessions = Artist.find(params[:artist_id]).recording_sessions
    elsif params[:engineer_id]
      @recording_sessions = Engineer.find(params[:engineer_id]).recording_sessions
    elsif params[:studio_id]
      @recording_sessions = Studio.find(params[:studio_id]).recording_sessions
    else
      @recording_sessions = RecordingSession.all
   #    redirect_to action: 'index'
         end
  end 


  def show
    index
    # binding.pry
    @recording_session = RecordingSession.find(params[:id])
    #     redirect_to action: 'index'
    
  end

  def new
    @recording_session = Recording_Session.new
    # params.require(:recording_session).permit(:appointment_date, :studio_id, :engineer_id, :artist_id)
    # if artist_id or not -- that
    # if nested_--tind artist build --what is associated
    index
  end

  def create
    # binding.pry
    @recording_session = Recording_Session.new(recording_session_params)
    index
    # @recording_session = Recording_Session.find(params[:id])
    if @recording_session.save
      # raise params.inspect
#      redirect_to action: 'index' # , notice: 'Recording Session created'
      redirect_to @recording_session # , notice: 'Recording Session created'
    else
      # @studios = Studio.all
      render action: 'new'
    end
  end

  def edit
    @recording_session = Recording_Session.find(params[:id])
    index
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

  #    @recording_sessions = Recording_Session.all
  #    @engineers = Engineer.all
  #    @engineer = Engineer.find(params[:id])
  #    @studios = Studio.all
  #    @artists = Artist.all
  #    render action: 'edit'
  # end
  # end

  def update
    index
    @recording_session = Recording_Session.find(params[:id])
    # raise params.inspect
    if @recording_session.update(params.require(:recording_session).permit(:appointment_date, :studio_id, :engineer_id, :artist_id))
      # binding.pry
      redirect_to recording_session_path(@recording_session)

    else
      render 'edit'
  end
  end

  #   def update
  #     @recording_session = Recording_Session.find(params[:id])
  #     #@recording_session.update(params.require(:recording_session).permit(:appointment_date, :studio, :engineer, :artist)
  #     raise params.inspect
  #     if @recording_session.update_attributes(recording_session_param)
  #       redirect_to action: 'show', id: @recording_session
  #     else

  #       @recording_sessions = Recording_Session.all
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

private

def recording_session_params
  params.require(:recording_session).permit(:appointment_date, :studio_id, :engineer_id, :artist_id)
end




end
