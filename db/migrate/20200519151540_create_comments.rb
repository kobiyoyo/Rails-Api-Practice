class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :content
      t.integer :photo_id
      t.string :owner

      t.timestamps
    end
  end
end
