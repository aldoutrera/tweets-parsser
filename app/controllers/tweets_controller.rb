class TweetsController < ApplicationController
  def index
    user   = User.find_by_id(session[:user_id])
    client = Twitter::Client.new(
      :oauth_token => user.oauth_token,
      :oauth_token_secret => user.oauth_token_secret
    )
    @tweets = client.home_timeline
    respond_to do |format|
      format.html # index.html.erb
      format.rss { render layout: false }
    end
  end
end
