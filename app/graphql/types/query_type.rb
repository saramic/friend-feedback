module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :invitations, resolver: Resolvers::Invitations
    field :invitation, resolver: Resolvers::Invitation
    field :user, resolver: Resolvers::User
  end
end
