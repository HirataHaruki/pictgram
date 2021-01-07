class CommentsController < ApplicationController
  def new
    @topic = Topic.find_by(params[:topic_id])
    @comment = Comment.new
  end
  
  def create
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      redirect_to topics_path, success: 'コメントを投稿しました'
    else
      flash.now[:danger] = 'コメントの投稿に失敗しました'
      render :new
    end
  end
  
  private
  def comment_params
    params.require(:comment).permit(:content, :user_id, :topic_id)
  end
end
