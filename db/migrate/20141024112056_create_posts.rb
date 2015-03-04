class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.string :img_link
      t.string :location
      t.string :email
      t.string :phone
      t.integer :category_id
      t.string :edit_key

      t.timestamps
    end
  end
end
