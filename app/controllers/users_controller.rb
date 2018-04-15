# frozen_string_literal: true

class UsersController < ApplicationController
  authorize_resource

  before_action :find_user, only: %i[edit update]

  def index
    @users = User.all
  end

  def update
    if @user.update(user_params)
      redirect_to users_path, notice: t('message_of_modification')
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:role)
  end

  def find_user
    @user = User.find(params[:id])
  end
end
