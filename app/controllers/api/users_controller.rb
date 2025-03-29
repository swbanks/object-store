class Api::UsersController < ApplicationController
  def index
    users = []
    User.find_each do |user|
      users << {'id': user.id, 'name': user.username}
    end

    render json: users
  end

  def create
    user = User.new(params.permit(:username))

    if user.save
      render json: {'id': user.id, 'name': user.username}
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    user = User.find(params[:id])
    name = user.username
    user.destroy!

    render json: {'name': name}
  end
end