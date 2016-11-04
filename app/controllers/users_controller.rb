class UsersController < ApplicationController
  before_action :set_user, only: [:show, :follow, :unfollow]

  # GET /users/1
  # GET /users/1.json
  def show
     @posts = Post.by_user_id(@user.id).order("created_at DESC")
  end

  # GET /users/1/edit
  def update

  end

  def search

  end

  def follow
    if current_user.follow(@user)
      #UserMailer.followed_by_user(@user, current_user).deliver
    end

    redirect_to user_profile_path(@user.username)
  end

  def unfollow
    current_user.unfollow(@user)
    redirect_to user_profile_path(@user.username)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.confirmed.by_username(params[:username]).first
      if @user.blank?
        render file: "public/404.html", status: 404
        return
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :avatar)
    end
end
