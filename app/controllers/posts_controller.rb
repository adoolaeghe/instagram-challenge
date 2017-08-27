class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:show, :edit, :update, :destroy, :like]

  def create
    @post = current_user.posts.build(post_params)

      if @post.save
        flash[:success] = "Your post has been created!"
        redirect_to posts_path
      else
        flash[:alert] = "Your new post couldn't be created!  Please check the form."
        render :new
      end
  end

  def index
    @posts = Post.reverse_order
    @like = Like.new
  end

  def show
  end

  def new
    @post = Post.new
  end

  def edit
  end


  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def like
    if @post.liked_by current_user
    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end
    end
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:image)
    end
end
