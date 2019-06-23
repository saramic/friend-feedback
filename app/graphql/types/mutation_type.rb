module Types
  class MutationType < Types::BaseObject
    field :update_invitation, mutation: Mutations::UpdateInvitation
  end
end
