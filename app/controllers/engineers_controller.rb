class EngineersController < ApplicationController
    # before_filter :authenticate_user!
    before_action :authenticate_user!


    def index
    @engineers = Engineer.all
    @recording_sessions = RecordingSession.all
   # @engineers = Engineer.all
  #  @engineers = engineer.all
      end

def show
    #index
    # binding.pry
    @engineer = Engineer.find(params[:id])
    #     redirect_to action: 'index'
  end
def new
    @engineer = Engineer.new
  end

def create
      # binding.pry
      @engineer = Engineer.new(engineer_params)
  #    @artist = Artist.new(params[:name]
      #index
      # @artist = Artist.find(params[:id])
      if @engineer.save
        # raise params.inspect
  #      redirect_to action: 'index' # , notice: 'Artist created'
        redirect_to @engineer # , notice: 'Artist created'
      else
        # @engineers = Engineer.all
        render action: 'new'
      end
  end

  def destroy
    Engineer.find(params[:id]).destroy
    redirect_to 'index'
    #redirect_to '/engineers'
    #redirect_to recording_session_path
  end


def edit
  index
    @engineer = Engineer.find(params[:id])
 #   index
  end






def update
    #index
    #binding.pry
    @engineer = Engineer.find(params[:id])
    # raise params.inspect
    if @engineer.update(params.require(:engineer).permit(:name))
      redirect_to engineer_path(@engineer)
    else
      render 'edit'
    end
end
  private
  def engineer_params
    params.require(:engineer).permit(:name)
  end

end
