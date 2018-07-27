class UsersController < ApplicationController
  def show
    user_id = params[:id]
    @user = User.find(user_id)
    @works = Job.where(id: @user.assigns.where.not(status: 'applying').select(:user_id))
    @reviews = @user.reviews
  end
end
