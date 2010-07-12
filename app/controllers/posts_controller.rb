class PostsController < ApplicationController
  before_filter :require_user

  uses_tiny_mce(:options => {:theme => 'advanced',
  :browsers => %w{msie gecko},
  :theme_advanced_toolbar_location => "top",
  :theme_advanced_toolbar_align => "left",
  :theme_advanced_resizing => true,
  :theme_advanced_resize_horizontal => false,
  :paste_auto_cleanup_on_paste => true,
  :theme_advanced_buttons1 => %w{formatselect fontselect fontsizeselect bold italic underline strikethrough separator justifyleft justifycenter justifyright indent outdent separator bullist numlist forecolor backcolor separator link unlink image undo redo},
  :theme_advanced_buttons2 => [],
  :theme_advanced_buttons3 => [],
  :plugins => %w{contextmenu paste}},
  :only => [:new, :edit, :show, :index])

  def post_published
    #@user = @current_user
    #@post = @user.posts.find(params[:id])
    @post = Post.find(params[:id]) 
    @post.publish! 
    redirect_to :action => 'index' and return

  end	

  def change_to_draft
    #@user = @current_user
    #@post = @user.posts.find(params[:id])
    @post = Post.find(params[:id]) 
    @post.suspend! 
    redirect_to :action => 'draft' and return 
  end	

  def draft
    @user = @current_user
    @posts = @user.posts.draft_posts
    #@posts = Post.draft_posts

    respond_to do |format|
      format.html # draft.html.erb
      format.xml  { render :xml => @posts }
    end
  end

  def tag_cloud
    @tags = Post.tag_counts # returns all the tags used
  end

  # GET /posts
  # GET /posts.xml
  def index
    #@user = @current_user
    #@posts = @user.posts.find(:all)
    #@posts = @user.posts.published_posts
    @posts = Post.published_posts
    #@posts = Post.find(:all)
    @tags = Post.tag_counts()

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.xml
  def show
    #@user = @current_user
    #@post = @user.posts.find(params[:id])
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.xml
  def new
    @user = @current_user
    #@post = @user.posts.build
    @post = Post.new
    @post.name = @user.login

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @user = @current_user
    #@post = @user.posts.find(params[:id])
    @post = Post.find(params[:id])
    @post.suspend!
  end

  # POST /posts
  # POST /posts.xml
  def create
    @user = @current_user
    #@post = @user.posts.build(params[:post])
    @post = Post.new(params[:post].merge(:user => current_user))
    @post.name = @user.login

    respond_to do |format|
      if @post.save
        flash[:notice] = 'Post was successfully created.'
        format.html { redirect_to(@post) }
        format.xml  { render :xml => @post, :status => :created, :location => @post }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.xml
  def update
    @user = @current_user
    @post = Post.find(params[:id])
    @post.name = @user.login

    respond_to do |format|
      if @post.update_attributes(params[:post])
        flash[:notice] = 'Post was successfully updated.'
        format.html { redirect_to(@post) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.xml
  def destroy
    #@user = @current_user
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to(posts_url) }
      format.xml  { head :ok }
    end
  end
end
