class CreateBlogs < ActiveRecord::Migration[6.1]
  def change
    create_table :blogs do |t|
      t.string :title
      t.string :image
      t.text :body
      t.string :slug
      t.integer :user_id
      t.timestamps
    end
  end
end
