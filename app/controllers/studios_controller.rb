class StudiosController < ApplicationController
  


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
      @recording_sessions = Recording_Session.all
   #    redirect_to action: 'index'
 end
 end




    def edit
    #index
    @studios = Studio.all
    #@engineer = Engineer.find(params[:id])
    #@artist = Artist.find(params[:id])
    #@recording_session = RecordingSession.find(params[:id])
    @studio =Studio.find(params[:id])
  end


def show
  index
    # binding.pry
    @studio = Studio.find(params[:id])
    #     redirect_to action: 'index'

end
end
