class CreateBlogs < ActiveRecord::Migration[7.0]
  def change
    create_table :blogs do |t|
      t.string :title
      t.string :image
      t.text :body
      t.string :slug
      t.belongs_to :user

      t.timestamps
    end
  end
end
