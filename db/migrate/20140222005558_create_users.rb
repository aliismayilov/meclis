class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :provider
      t.string :uid
      t.string :access_token
      t.string :avatar_photo_url
      t.string :name

      t.timestamps
    end
  end
end
