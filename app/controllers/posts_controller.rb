class PostsController < ApplicationController

  # GET /posts/index
  def index
    @posts = Post.on_user_timeline(current_user.id).order("posts.created_at DESC")
    @post = Post.new
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    # setting the user_id in the post to be the id from signed_in user
    @post.user_id = current_user.id

    respond_to do |format|
      if @post.save
        format.html { redirect_to posts_path, notice: 'Post successfully created' }
        format.json { render :index, status: :created, location: posts_path }
      else
        @posts = Post.on_user_timeline(current_user.id).order("posts.created_at DESC")
        format.html { render :index }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:content, :user_id)
    end
end
