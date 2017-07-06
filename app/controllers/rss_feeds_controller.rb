class RssFeedsController < ApplicationController

  def create
    feed = Hash.from_xml(params[:feed])
    rss_feed = RssFeed.find_or_create_by(url: feed["feed"]["status"]["feed"].strip)
    FeedHistory.create(rss_feed_id: rss_feed.id, parameters: feed) 
    render json: {success: true, id: rss_feed.id}
  end
end
