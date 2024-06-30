class AddTagsToBlogs < ActiveRecord::Migration[7.0]
  def change
    add_column :blogs, :tags, :string
  end
end
