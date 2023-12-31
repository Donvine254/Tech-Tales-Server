class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest, null: false
      t.string :email
      t.string :picture
      t.timestamps
    end
  end
end
