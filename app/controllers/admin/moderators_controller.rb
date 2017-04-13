class Admin::ModeratorsController < ApplicationController
  def index
    @moderators = Moderator.all
  end

  def edit
    @moderator = Moderator.find(params[:id])
  end

  def update
    @moderator = Moderator.find(params[:id])
    byebug
    if @moderator.update(moderator_params)
      redirect_to :back
    else
      render 'edit'
    end
  end



  def moderator_params
    params.require(:moderator).permit(:id, :fullname, :username, :password)
  end

end
