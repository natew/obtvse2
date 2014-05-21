class SorceryExternal < ActiveRecord::Migration
  def self.up
    create_table :obtvse_authentications do |t|
      t.integer :obtvse_user_id, :null => false
      t.string :obtvse_provider, :uid, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :obtvse_authentications
  end
end
