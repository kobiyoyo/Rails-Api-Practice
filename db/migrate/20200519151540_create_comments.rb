class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :content
      t.references :photo, null: false, foreign_key: true
      t.string :owner

      t.timestamps
    end
  end
end
