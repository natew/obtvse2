class CleanupDatamodel < ActiveRecord::Migration
  def up
    drop_table :authentications
    drop_table :images

    change_column :posts, :title, :string, null: false
    change_column :posts, :slug, :string, null: false, unique: true

    change_column :revisions, :post_id, :integer, null: false
    change_column :revisions, :content, :text, null: false
    change_column :revisions, :title, :string, null: false
    add_foreign_key :revisions, :posts
    remove_column :revisions, :version

    remove_column :posts, :aside
    remove_column :posts, :timespent
    remove_column :posts, :parent
  end

  def down
    create_table :images do |t|
      t.string :image_file_name, :image_file_size, :image_content_type
      t.timestamp :image_updated_at
    end

    create_table :authentications do |t|
      t.integer :user_id, :null => false
      t.string :provider, :uid, :null => false

      t.timestamps
    end

    change_column :posts, :title, :string, null: true
    change_column :posts, :slug, :string, null: true, unique: false

    change_column :revisions, :post_id, :integer, null: true
    change_column :revisions, :content, :text, null: true
    change_column :revisions, :title, :string, null: true
    remove_foreign_key :revisions, :posts
    add_column :revisions, :version, :integer

    add_column :posts, :aside, :boolean, default: false
    add_column :posts, :timespent, :integer
    add_column :posts, :parent, :integer
  end
end
