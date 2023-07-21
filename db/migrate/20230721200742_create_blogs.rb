class CreateBlogs < ActiveRecord::Migration[6.1]
  def change
    create_table :blogs do |t|
      t.string :title
      t.text :body
      t.string :slug
      t.references :author, foreign_key: {to_table: :users}
      t.timestamps
    end
  end
end
