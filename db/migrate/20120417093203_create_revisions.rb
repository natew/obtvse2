class CreateRevisions < ActiveRecord::Migration
  def change
    create_table :revisions do |t|
      t.integer :version
      t.text :content
      t.references :post
      t.timestamps null: false
    end
  end
end
