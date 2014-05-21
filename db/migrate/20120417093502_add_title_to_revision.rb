class AddTitleToRevision < ActiveRecord::Migration
  def change
    add_column :obtvse_revisions, :title, :string
    remove_column :obtvse_posts, :version
    remove_column :obtvse_posts, :position
  end
end
