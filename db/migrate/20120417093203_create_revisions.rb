class CreateRevisions < ActiveRecord::Migration
  def change
    create_table :obtvse_revisions do |t|
      t.integer :version
      t.text :content
      t.references :post
      t.timestamps
    end
  end
end
