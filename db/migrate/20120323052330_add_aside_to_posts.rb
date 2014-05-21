class AddAsideToPosts < ActiveRecord::Migration
  def change
    add_column :obtvse_posts, :aside, :boolean, :default => false
  end
end
