class CreateReactions < ActiveRecord::Migration[8.1]
  def change
    create_table :reactions do |t|
      t.references :message, null: false, foreign_key: true
      t.string :emoji
      t.string :sender_name

      t.timestamps
    end
  end
end
