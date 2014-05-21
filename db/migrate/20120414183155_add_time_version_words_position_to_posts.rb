class AddTimeVersionWordsPositionToPosts < ActiveRecord::Migration
  def change
    add_column :obtvse_posts, :version, :integer
    add_column :obtvse_posts, :position, :integer
    add_column :obtvse_posts, :timespent, :integer
  end
end
