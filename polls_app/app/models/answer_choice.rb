class AnswerChoice < ApplicationRecord
    validates :text, presence:true

    belongs_to :question,
        primary_key: :id,
        foreign_key: :question_id,
        class_name: :Question

    has_many :responses,
        primary_key: :id,
        foreign_key: :answer_id,
        class_name: :Response,
        dependent: :destroy
end