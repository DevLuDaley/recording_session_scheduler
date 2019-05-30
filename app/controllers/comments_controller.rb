class CommentsController < ApplicationController
    #before_filter :authenticate_user!
    #before_action :authenticate_user!

  def index
    @comments = Comment.all 
    @recording_sessions = RecordingSession.all
    #calling 'index'miltiple times because of select (@artists) method in recoriding_session_controller#new
    @engineers = Engineer.all
    @studios = Studio.all
    @artists = Artist.all

  end


  def show
    index
    @comment = Comment.find(params[:id])
   # binding.pry
    #     redirect_to action: 'index'
  end

  def new
    index
    #if params[:artist_id]
          # redirect_to action: 'index'

    #else
  #    @recording_session.artist.id = Artist.find(params[:artist_id])
    @comment = Comment.new#(params[:id])
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
    @comment = Comment.new(comment_params)
    @artist = Artist.find(params[:artist_id])
    @comment.artist_id = @artist.id
#  binding.pry
   if @comment.save
    # raise params.inspect
      redirect_to @comment # , notice: 'Recording Session created'
    else
      # @studios = Studio.all
      render action: 'new'
    end
  end



  def edit
    index
 @comment = Comment.find(params[:id])
  if params[:artist_id]
      @comment = Comment.find(params[:artist_id]).comments
 #     @artist = Artist.find_by(id: params[:artist_id])
#  if @artist.nil?
#   redirect_to artists_path, alert: "Artist not found"
#  else
#   @recording_sessions = @artist.recording_sessions 
   # elsif params[:engineer_id]
    #  @recording_sessions = Engineer.find(params[:engineer_id]).recording_sessions
    #elsif params[:studio_id]
    #  @recording_sessions = Studio.find(params[:studio_id]).recording_sessions
    else
    #  @recording_sessions = RecordingSession.all
   #    redirect_to action: 'index'
         end
  end


  def update
    index
    @comment = Comment.find(params[:id])
    # raise params.inspect
    if @comment.update(params.require(:comment).permit(:artist_id, :status))
      # binding.pry
      redirect_to comment_path(@comment)

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
    Comment.find(params[:id]).destroy
    redirect_to action: 'index'
    #redirect_to comments_path
  end

# def create_artist_from_name
#   self.artist_name = new_artist_name if not new_artist_name.blank?
# end
private

def comment_params
  params.require(:comment).permit(:content, params[:artist_id])
end

#def artist_attributes
 # params.require(:artist).permit(:artist_id) #, :artist_created_name
#end





end



