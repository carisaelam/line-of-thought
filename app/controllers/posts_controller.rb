class PostsController < ApplicationController
  include ActionView::RecordIdentifier

  before_action :authenticate_user!
  before_action :set_post, only: %i[ show edit update destroy ]

  # GET /posts or /posts.json
  def index
    @posts = Post.all
    @comments = Comment.all
    @user = current_user
  end

  # GET /posts/1 or /posts/1.json
  def show
    @post = Post.find(params[:id])
    @like = @post.likes.find_by(user: current_user)
    @comment = @post.comments.build
    @comments = @post.comments
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
    @user = current_user
    unless @post.user == @user
      flash[:alert] = "Not your post"
      redirect_to posts_path
    end
  end

  # POST /posts or /posts.json
  def create
    @post = current_user.posts.build(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to post_path(@post), notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    @user = current_user
    if @user == @post.user
      respond_to do |format|
        if @post.update(post_params)
          format.html { redirect_to post_url(@post), notice: "Post was successfully updated." }
          format.json { render :show, status: :ok, location: @post }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @post.errors, status: :unprocessable_entity }
        end
      end
    else
      flash[:alert] = "Not your post"
      redirect_to posts_path
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @user = current_user
    like = @post.likes.find_by(user: current_user)
    like.destroy if like

    if @user == @post.user
        @post.destroy
        redirect_to posts_path
        flash[:notice] = "Post deleted"
    else
      flash[:alert] = "Not your post"
      redirect_to posts_path
    end
  end



  def like
    @post = Post.find(params[:id])
    existing_like = @post.likes.find_by(user: current_user)

    if existing_like
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace(@post, partial: "posts/like_buttons", locals: { post: @post }) }
      end
    else
      Like.create(user: current_user, post: @post)
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace(@post, partial: "posts/like_buttons", locals: { post: @post }) }
      end
    end
  end

  def following
    @user = current_user
    @posts = Post.all.where(user: current_user)
                            .or(Post.where(user_id: current_user.followees.pluck(:id)))
    @comments = Comment.all
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :body)
    end
end
