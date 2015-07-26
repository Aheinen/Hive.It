class SessionsController < ApplicationController

  def create
    user = User.from_omniauth(env['omniauth.auth'])
    session[:user_id] = user.id
    render json: {user_id: user.id}
  end

  def destroy
    session[:user_id] = nil
  end

end
