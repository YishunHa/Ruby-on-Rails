class Admin::TagsController < Admin::ApplicationController
  def new
    @tag = Tag.new
    @tags = Tag.all.order(id: :desc)
  end

  def create
    tags_params[:name].split(',').map do |n|
      Tag.new(name: n).save
    end
    redirect_to new_admin_tag_url, notice: 'Tag was successfully created!'
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def update
    @tag = Tag.find(params[:id])
    if @tag.update tags_params
      redirect_to new_admin_tag_url, notice: 'Update successfully'
    else
      flash[:alert] = 'There was a problem occuries when updating the tag!'
      render :edit
    end
  end

  def show
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy

    redirect_to :back, notice: 'Deleted tag successfully'
  end

  private

  def tags_params
    params.require(:tag).permit(:id, :name)
  end
end
