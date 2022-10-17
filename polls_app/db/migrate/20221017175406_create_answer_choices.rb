class CreateAnswerChoices < ActiveRecord::Migration[7.0]
  def change
    create_table :answer_choices do |t|
      t.bigint :question_id, null:false
      t.string :text, null:false

      t.timestamps
    end

    add_foreign_key :answer_choices, :questions, column: :question_id, primary_key: :id
  end
end
