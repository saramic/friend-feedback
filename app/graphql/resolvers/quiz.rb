module Resolvers
  class Quiz < Resolvers::BaseResolver
    description "Find quiz for logged in user"

    argument :id, ID, required: true

    type Types::Quiz, null: false

    def resolve(id:)
      ::Quiz.joins(:invitations).includes(invitations: :user)
        .where(
          ::Quiz.arel_table[:organiser_id]
          .eq(context[:current_user].id)
          .or(
            ::Invitation.arel_table[:user_id]
            .eq(context[:current_user].id)
          )
        ).find(id)
    end
  end
end