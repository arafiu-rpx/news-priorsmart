class FeedHistory < ApplicationRecord
  belongs_to :rss_feed, dependent: :destroy
end
