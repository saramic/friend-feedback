module Resolvers
  class Quiz < Resolvers::BaseResolver
    description "Find quiz for logged in user"

    argument :id, ID, required: true

    type Types::Quiz, null: false

    def resolve(id:)
      ::Quiz
        .left_joins(:invitations, :questions)
        .left_joins(questions: :questions_quizzes)
        .joins(questions_quizzes: :votes)
        .includes(invitations: :user)
        .includes(:questions)
        .includes(questions_quizzes: :votes)
        .where(
          ::Quiz.arel_table[:organiser_id]
          .eq(context[:current_user].id)
          .or(
            ::Invitation.arel_table[:user_id]
            .eq(context[:current_user].id)
          )
        )
        .where(::QuestionsQuiz.arel_table[:quiz_id].eq(id))
        .find(id)
    end
  end
end