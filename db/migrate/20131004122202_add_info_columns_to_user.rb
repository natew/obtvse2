class AddInfoColumnsToUser < ActiveRecord::Migration
  def change
  	add_column :users, :name, :string
  	add_column :users, :twitter, :string
  	add_column :users, :github, :string
  	add_column :users, :about, :text
  	add_column :users, :ga_id, :string
  	add_column :users, :blog_title, :string
  end
end
