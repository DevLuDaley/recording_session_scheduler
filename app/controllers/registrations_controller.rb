class RegistrationsController < Devise::RegistrationsController
#before_action :authenticate_user!
    private
    def signup_params
        params.require(:engineer).permit( :name,
                                      :email,
                                      :password,
                                      :password_confirmation)
    end

    # def signin_params
    #     params.require(:engineer).permit( :name,
    #                                   :email,
    #                                   :password,
    #                                   :password_confirmation)
    # end

    def account_update_params
        params.require(:engineer).permit( :name,
                                        :email,
                                        :password,
                                        :password_confirmation,
                                        :current_password)
    end



#  def index
#     @engineers = Engineer.all
#     #@engineer = Engineer.find(params[:id])
#     @engineer = current_engineer #Engineer.find(params[:id])
#     @recording_sessions = RecordingSession.all
#     @studios = Studio.all
#     @artists = Artist.all
#        redirect_to '/recording_sessions'
#  end



# def show
#      index
# #     # binding.pry
#      @engineer = Engineer.find(params[:id])
#      redirect_to action: 'index'
    
#    end



end