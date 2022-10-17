class CreatePolls < ActiveRecord::Migration[7.0]
  def change
    create_table :polls do |t|
      t.bigint :author_id, null: false
      t.string :title

      t.timestamps
    end

    add_foreign_key :polls, :users, column: :author_id, primary_key: :id
  end
end
