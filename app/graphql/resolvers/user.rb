module Resolvers
  class User < Resolvers::BaseResolver
    description "Currently logged in user"

    type Types::User, null: false

    def resolve()
      ::User.find(context[:current_user].id)
    end
  end
end