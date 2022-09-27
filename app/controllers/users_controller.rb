class UsersController < ApplicationController
  include Pagy::Backend
  def index
    # @pagy , @users = pagy(User.order(created_at: :desc))
    @q = User.order(created_at: :desc).ransack(params[:q])
    @pagy, @users = pagy(@q.result(distinct: true))
  end
  def show
    @user = User.find(params[:id])
    flash[:alert] = "You are on a user page"
  end
end