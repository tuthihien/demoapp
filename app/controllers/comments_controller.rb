class CommentsController < ApplicationController
  def create
      @comment= current_user.comments.build(comment_params)
      if @comment.save
      	flash[:success] ="success commented"
      	redirect_to :back
      else
      	flash.now[:danger] = "error"
      end
  end

  private
  def comment_params
  	params.require(:comment).permit(:content, :entry_id)
  end
end
