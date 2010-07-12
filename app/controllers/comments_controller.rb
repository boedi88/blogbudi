class CommentsController < ApplicationController
  def index
    @user = @current_user
    @post = Post.find(params[:post_id])
    @comments = @post.comments
  end

  def show
    @user = @current_user
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
  end

  def new
    @user = @current_user
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build
    @comment.commenter = @user.login
  end

  def create
    @user = @current_user
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(params[:comment])
    @comment.commenter = @user.login
    if @comment.save
      redirect_to post_comment_url(@post, @comment)
    else
      render :action => "new"
    end
  end

  def edit
    @user = @current_user
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])

    if @comment.commenter == @user.login
    else
      flash[:notice] = 'You are not allowed to edit this comment.'
      redirect_to post_comments_path(@post)
    end
  end

  def update
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(params[:comment])
      redirect_to post_comment_url(@post, @comment)
    else
      render :action => "edit"
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to post_comments_path(@post) }
      format.xml  { head :ok }
    end
  end
end
