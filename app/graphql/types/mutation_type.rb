module Types
  class MutationType < Types::BaseObject
    field :update_invitation, mutation: Mutations::UpdateInvitation
    field :vote_on_question, mutation: Mutations::VoteOnQuestion
  end
end
