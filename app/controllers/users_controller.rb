class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  # GET /users/1
  # GET /users/1.json
  def show
     @posts = Post.by_user_id(@user.id).order("created_at DESC")
  end

  # GET /users/1/edit
  def update
  end

  # POST /users
  # POST /users.json


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
