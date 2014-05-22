class AddParentToPosts < ActiveRecord::Migration
  def change
    add_column :obtvse_posts, :parent, :integer
  end
end
