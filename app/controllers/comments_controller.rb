class CommentsController < ApplicationController

  def create
    @prototype = Prototype.find(params[:prototype_id])
    @comment = @prototype.comments.new(comments_params)
    if @comment.valid?
      @comment.save
      redirect_to prototype_path(params[:prototype_id])
    else
      @prototype = @comment.prototype
      @comments = @prototype.comments
      redirect_to "/prototypes/#{@prototype.id}" 
    end
  end
  private
  def comments_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id)
  end

end
