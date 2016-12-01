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
def destroy 
   @comment=Comment.find(params[:id])
   @entry=@comment.entry
   @comment.destroy
    flash[:success] = "comment deleted"
    redirect_to @entry
end
def edit
  @comment=Comment.find(params[:id])
end
def update
@comment=Comment.find(params[:id])
      if @comment.update_attributes(comment_params)
        flash[:success]="comment edited"
        redirect_to @comment.entry
      else
        render 'edit'
      end
end  
  private
  def comment_params
    params.require(:comment).permit(:content, :entry_id)
  end
end