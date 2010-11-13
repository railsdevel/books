class UsersController < ApplicationController
  def index
    @users = User.limit(20)
  end

  def show
    @user = User.find(params[:id])
  end
end
