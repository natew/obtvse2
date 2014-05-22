class UpdatedPublishedAts < ActiveRecord::Migration
  def up
    Obtvse::Post.published.where('published_at is null').each do |post|
      post.update_attributes(published_at: post.created_at)
    end
  end

  def down
  end
end
