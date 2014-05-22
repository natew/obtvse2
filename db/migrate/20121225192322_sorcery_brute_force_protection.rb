class SorceryBruteForceProtection < ActiveRecord::Migration
  def self.up
    add_column :obtvse_users, :failed_logins_count, :integer, :default => 0
    add_column :obtvse_users, :lock_expires_at, :datetime, :default => nil
  end

  def self.down
    remove_column :obtvse_users, :lock_expires_at
    remove_column :obtvse_users, :failed_logins_count
  end
end
