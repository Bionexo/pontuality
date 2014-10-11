class Auth::AuthController < ActionController::Base
  def sign_in
    data = request.env["omniauth.auth"]
    user_info = data["info"]

    session[:user] = user = User.create({
      uid: data["uid"],
      email: user_info["email"],
      name: "#{user_info["first_name"]} #{user_info["last_name"]}",
      image: user_info["image"]
    })

    if session[:user]
      redirect_to root_path
    else
      render json: { error: 'internal server error' }, status: 500
    end
  end
end
