class CreateSocialMedia < ActiveRecord::Migration[7.0]
  def change
    create_table :social_media do |t|
      t.string :platform
      t.string :url
      t.belongs_to :user

      t.timestamps
    end
  end
end
