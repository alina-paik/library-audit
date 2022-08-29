class ApplicationController < ActionController::API
SECRET = "yoursecretword"

  attr_reader :user

  def authentication
      decode_data = decode_user_data(request.cookies["session"])
      user_id = decode_data[0]["user_id"] unless !decode_data
      @user = User.find(user_id) if user_id


      if user
        return true
      else
        render json: { message: "invalid credentials" }
      end
    end

    def encode_user_data(payload)
      token = JWT.encode payload, SECRET, "HS256"
      return token
    end

    def decode_user_data(token)
      begin
        data = JWT.decode token, SECRET, true, { algorithm: "HS256" }
        return data
      rescue => e
        puts e
      end
    end
end
