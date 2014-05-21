class AddPublishedAtToPosts < ActiveRecord::Migration
  def change
    add_column :obtvse_posts, :published_at, :timestamp
  end
end
