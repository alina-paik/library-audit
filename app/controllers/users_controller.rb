class UsersController < ApplicationController
  before_action :authentication, except: %i[create]
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
    if user.save
      token = encode_user_data({ user_data: user.id })

      # return to user
      render json: user
    else
      # render error message
      render json: { message: "invalid credentials" }
    end
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
end
