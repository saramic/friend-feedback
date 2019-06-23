module Resolvers
  class Invitation < Resolvers::BaseResolver
    description "An invitation"

    argument :id, ID, required: true

    type Types::Invitation, null: false

    def resolve(id:)
      ::Invitation.where(user: context[:current_user]).find(id)
    end
  end
end