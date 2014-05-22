class AddUrlToPosts < ActiveRecord::Migration
  def change
    add_column :obtvse_posts, :url, :string
  end
end
