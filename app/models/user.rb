class User < ActiveRecord::Base
  attr_accessible :name, :oauth_token, :oauth_token_secret
  validates :name, presence: true, uniqueness: true
end
