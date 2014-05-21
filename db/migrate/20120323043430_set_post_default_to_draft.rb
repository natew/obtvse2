class SetPostDefaultToDraft < ActiveRecord::Migration
  def change
    change_column_default :obtvse_posts, :draft, true
  end
end
