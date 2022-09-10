# frozen_string_literal: true

class ApplicationController < ActionController::API
  include ActionPolicy::Controller
  authorize :user, through: :user

  attr_reader :user

  def authentication
    decode_data = decode_user_data(request.cookies['session'])
    user_id = decode_data[0]['user_id'] if decode_data
    @user = User.find(user_id) if user_id

    if user
      true
    else
      render json: { message: 'user is unauthorized' }, status: :unauthorized
    end
  end

  def encode_user_data(payload)
    JWT.encode payload, ENV['SECRET'], 'HS256'
  end

  def decode_user_data(token)
    JWT.decode token, ENV['SECRET'], true, algorithm: 'HS256'
  rescue StandardError => e
    puts e
  end
end
