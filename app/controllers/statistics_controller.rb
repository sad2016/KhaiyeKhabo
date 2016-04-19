class StatisticsController < ApplicationController

  def index
    authorize! :index, :StatisticsController
    @users = User.all.where(role_id: 2).order('created_at DESC')
    @user_count=@users.count
  end
end
