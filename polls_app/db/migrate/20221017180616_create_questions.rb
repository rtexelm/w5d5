class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.bigint :poll_id, null:false
      t.string :text

      t.timestamps
    end
    
    add_foreign_key :questions, :polls, column: :poll_id, primary_key: :id
  end
end
