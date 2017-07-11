class StatusController < ApplicationController
  def database_read_health
    feed_count = RssFeed.count
    render json: {urls_count: feed_count}, status: 200
  end
end
