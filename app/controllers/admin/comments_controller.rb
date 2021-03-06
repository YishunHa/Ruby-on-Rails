class Admin::CommentsController < Admin::ApplicationController
  def index
    if params[:search].present?
      @comments = Comment.joins(:visitor).where("fullname LIKE ? OR message LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%").page params[:page]
    else
    @comments = Comment.where(status: to_bool(params[:status])).page params[:page]
  end

  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(status: params[:status])
      redirect_to :back, notice: 'Updated comment successfully'
    else
      redirect_to :back, notice: 'Some problems occurs!'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    redirect_to :back, notice: 'Deleted successfully!'
  end
end
