xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "#{@user.name} Twitter Home Timeline"
    xml.description "A RSS Feed generated from the twitter home timeline of @#{@user.name}"

    for tweet in @tweets
      xml.item do
        xml.title tweet.user.name
        xml.description tweet.text
        xml.pubDate tweet.created_at.to_s(:rfc822)
        xml.link "https://twitter.com/#{tweet.user.screen_name}/status/#{tweet.id}"
        xml.guid tweet.id
      end
    end
  end
end
