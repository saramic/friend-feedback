module Resolvers
  class IncompleteQuizzes < Resolvers::BaseResolver
    description "Find incomplete quizzes for logged in user"

    type [Types::Quiz], null: false

    def resolve()
      ::Quiz.left_joins(:invitations, :questions)
        .where(
          ::Quiz.arel_table[:organiser_id]
          .eq(context[:current_user].id)
        ).where(questions_quizzes: { question_id: nil}).distinct
    end
  end
end