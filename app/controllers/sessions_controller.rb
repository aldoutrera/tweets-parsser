class SessionsController < ApplicationController
  def create
    user = User.find_or_create_by_name_and_oauth_token_and_oauth_token_secret(auth_hash.info.nickname, auth_hash.credentials.token, auth_hash.credentials.secret)
    session[:user_id] = user.id
    redirect_to '/tweets'
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
