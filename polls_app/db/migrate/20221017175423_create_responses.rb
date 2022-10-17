class CreateResponses < ActiveRecord::Migration[7.0]
  def change
    create_table :responses do |t|
      t.bigint :user_id, null:false
      t.bigint :answer_id, null: false

      t.timestamps
    end

    add_foreign_key :responses, :users, column: :user_id, primary_key: :id
    add_foreign_key :responses, :answer_choices, column: :answer_id, primary_key: :id
  end
end
