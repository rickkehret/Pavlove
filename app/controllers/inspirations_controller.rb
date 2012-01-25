class InspirationsController < ApplicationController
  before_filter :authenticate
  before_filter :authorized_user, :only => :destroy
  
  def create
    @inspiration = current_user.inspirations.build(params[:inspiration])
    if @inspiration.save
      flash[:success] = "Inspiration created!"
      redirect_to root_path
    else
      render 'pages/home'
    end
  end
  
  def destroy
    @inspiration.destroy
    redirect_to :back
  rescue
    redirect_to root_path
  end
  
  private
  
    def authorized_user
      @inspiration = current_user.inspirations.find(params[:id])
    rescue
      redirect_to root_path
    end
  
end
