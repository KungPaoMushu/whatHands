class CommentsController < ApplicationController  
  before_action :set_comment, only: [:show,:edit, :update, :destroy]
  before_filter :authenticate_user!

  
  def index
    if user_signed_in?
      @comments = current_user.comments
    else
      redirct_to recipes_url,
      notice: 'Not logged in.'
  end
end

  def create
    commentable = commentable_type.constantize.find(commentable_id)
    @comment = Comment.build_from(commentable, current_user.id, body)

    respond_to do |format|
      if @comment.save
        make_child_comment
        format.html  { redirect_to(:back, :notice => 'Comment was successfully added.') }
      else
        format.html  { render :action => "new" }
      end
    end

    def update
      respond_to do |format|
        if @comment.update(comment_params)
          format.html { redirect_to posts_url, notice: 'Comment was successfully updated.' }
          format.json { render :show, status: :ok, location: @post }
        else
          format.html { render :edit }
          format.json { render json: @post.errors, status: :unprocessable_entity }
        end
      end
    end
    
  def destroy
    @user = current_user
    @comment = Comment.find(params[:id])
    @comment.destroy
      render :json => @comment, :status => :ok
    else
      render :js => "alert('error deleting comment');"
    end
  end
  private

  def comment_params
    params.require(:user_id)
    params.require(:comment).permit(:body, :commentable_id, :commentable_type, :comment_id)
  end

  def commentable_type
    comment_params[:commentable_type]
  end

  def commentable_id
    comment_params[:commentable_id]
  end

  def comment_id
    comment_params[:comment_id]
  end

  def body
    comment_params[:body]
  end

  def make_child_comment
    return "" if comment_id.blank?

    parent_comment = Comment.find comment_id
    @comment.move_to_child_of(parent_comment)
  end

end  