class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])

    if @post.comments.create(comment_params)
      redirect_to @post, notice: 'Comment was sucessfully created.'

    else
      redirect_to @post, alert: 'Error creating post.'

    end
  end
  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end
    def show
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to poste_path(@post)
end
  private

  def comment_params
      params.require(:comment).permit(:author, :body)
  end

  
end
