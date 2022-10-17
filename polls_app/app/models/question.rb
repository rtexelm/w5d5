class Question < ApplicationRecord
    validates :text, presence: true

    belongs_to :poll,
        primary_key: :id,
        foreign_key: :poll_id,
        class_name: :Poll

    has_many :answer_choices,
        primary_key: :id,
        foreign_key: :question_id,
        class_name: :AnswerChoice,
        dependent: :destroy

    has_many :responses, 
        through: :answer_choices,
        source: :responses

    def results
        hash =  {}
        self.answer_choices.each do |ac|
            hash[ac.text] = ac.responses.count
        end
        hash
    end

end