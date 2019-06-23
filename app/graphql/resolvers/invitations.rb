module Resolvers
  class Invitations < Resolvers::BaseResolver
    description "Find invitations for logged in user"

    type [Types::Invitation], null: false

    def resolve()
      ::Invitation.where(user: context[:current_user])
    end
  end
end