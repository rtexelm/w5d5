class Response < ApplicationRecord
    validate :not_duplicate_response, :author_cannot_respond
    belongs_to :respondent,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: :User

    belongs_to :answer_choice,
        primary_key: :id,
        foreign_key: :answer_id,
        class_name: :AnswerChoice

    has_one :question,
        through: :answer_choice,
        source: :question

    has_one :user_polls,
        through: :question,
        source: :poll


    def sibling_responses
        ref = self.question
        responses = ref.responses.where.not('responses.id = ?', self.id)
    end

    def respondent_already_answered?
        self.sibling_responses.exists?(user_id: self.user_id)
    end

    def not_duplicate_response
        if self.respondent_already_answered?
            errors.add(:respondent, "has already answered.")
        end
    end

    def author_cannot_respond
        if self.user_polls.author_id == self.user_id
            errors.add(:user_polls, "cannot respond to their own poll")
        end
    end


end