class TweetsController < ApplicationController
  def show
    user   = User.find_by_name(params[:id])
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

  def index
    @rssfeed_url = root_url
  end
end
