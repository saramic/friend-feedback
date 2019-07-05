module Resolvers
  class Quizzes < Resolvers::BaseResolver
    description "Find quizzes for logged in user"

    type [Types::Quiz], null: false

    def resolve()
      ::Quiz.joins(:invitations, :questions)
        .where(
          ::Quiz.arel_table[:organiser_id]
          .eq(context[:current_user].id)
          .or(
            ::Invitation.arel_table[:user_id]
            .eq(context[:current_user].id)
          )
        ).distinct
    end
  end
end