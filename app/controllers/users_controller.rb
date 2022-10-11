# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authentication, except: %i[create index]
  before_action :find_user, except: %i[create index]

  # GET /users
  def index
    @users = User.all
    render json: @users, status: :ok
  end

  # GET /users/:id
  def show
    render json: @user, status: :ok
  end

  # POST /users
  def create
    user = User.new(user_params)
    if (token = params["user"]["invite_token"])
      author = Author.find_by(invite_token: token, user_id: nil)
      (render(json: { message: 'author not found' }, status: :unprocessable_entity) && return) unless author
      save_user(user) {author.update(user_id: user.id)} && return
    end
    save_user(user)
  end

  # PUT /users/:id
  def update
    if @user.update(user_update_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private

  def find_user
    @user = User.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { errors: 'User not found' }, status: :not_found
  end

  def user_params
    params.require(:user).permit(:username, :email, :phone_number, :password, :password_confirmation, :admin)
  end

  def user_update_params
    params.require(:user).permit(:username, :email, :phone_number)
  end

  def save_user(user)
    if user.save
      yield if block_given?
      token = encode_user_data(user_id: user.id)
      render(json: user)
    else
      render(json: { message: 'invalid credentials' }, status: :unprocessable_entity)
    end
  end
end
