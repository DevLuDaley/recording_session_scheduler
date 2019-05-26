class StudiosController < ApplicationController
    # before_filter :authenticate_user!
  before_action :authenticate_user!

def index
    @studios = Studio.all
    @engineers = Engineer.all
    @artists = Artist.all
     @recording_sessions = RecordingSession.all
   #    redirect_to action: 'index'
 end

def new
    @studio = Studio.new
  end

def create
      # binding.pry
      @studio = Studio.new(studio_params)
  #    @studio = Studio.new(params[:name]
      #index
      # @studio = Artist.find(params[:id])
      if @studio.save
        # raise params.inspect
  #      redirect_to action: 'index' # , notice: 'Artist created'
        redirect_to @studio # , notice: 'Artist created'
      else
        # @studios = Studio.all
        render action: 'new'
      end
  end

    def edit
      #      binding.pry
      @studio = Studio.find(params[:id])
#    index
    #@studios = Studio.all
    #@engineer = Engineer.find(params[:id])
    #@artist = Artist.find(params[:id])
    #@recording_session = RecordingSession.find(params[:id])
  end

def show
  #index
    # binding.pry
    @studio = Studio.find(params[:id])
    #     redirect_to action: 'index'

end

def update
   # index
    #binding.pry
    @studio = Studio.find(params[:id])
    # raise params.inspect
    if @studio.update(params.require(:studio).permit(:name, :location))
      redirect_to studio_path(@studio)
    else
      render 'edit'
    end
end

def destroy
    Studio.find(params[:id]).destroy
    redirect_to action: 'index'
    #redirect_to recording_session_path
  end

#end
private
  def studio_params
    params.require(:studio).permit(:name, :location)
  end



#end
end
