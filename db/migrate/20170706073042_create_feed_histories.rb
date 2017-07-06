class CreateFeedHistories < ActiveRecord::Migration[5.1]
  def change
    create_table :feed_histories do |t|
      t.integer :rss_feed_id, index: true
      t.json :parameters
      t.timestamps
    end
  end
end
