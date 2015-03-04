class AddClickCount < ActiveRecord::Migration
  def change
    add_column :posts, :click_count, :integer, default: 0
  end
end
