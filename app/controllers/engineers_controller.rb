class EngineersController < ApplicationController
    # before_filter :authenticate_user!
    before_action :authenticate_user!


    def index
    @engineers = Engineer.all
    end

def show
    index
    # binding.pry
    @engineer = Engineer.find(params[:id])
    #     redirect_to action: 'index'
  end

end
