# frozen_string_literal: true

class AuthenticationController < ApplicationController
  def login
    user = User.find_by(email: params[:email])

    if user && user.password == params[:password]

      token = encode_user_data(user_id: user.id)
      response.set_cookie(
        :session,
        value: token,
        expires: 1.year.from_now,
        secure: Rails.env.production?,
        httponly: Rails.env.production?
      )

      render json: { message: 'login' }
    else
      render json: { message: 'invalid credentials' }
    end
  end

  def logout
    response.delete_cookie(:session)
    render json: { message: 'log out' }
  end
end
