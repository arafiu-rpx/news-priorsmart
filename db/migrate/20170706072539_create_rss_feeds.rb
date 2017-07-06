class CreateRssFeeds < ActiveRecord::Migration[5.1]
  def change
    create_table :rss_feeds do |t|
      t.string :url, index: true
      t.timestamps
    end
  end
end
