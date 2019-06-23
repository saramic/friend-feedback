module Mutations
  class UpdateInvitation < Mutations::BaseMutation
    argument :id, ID, required: true
    argument :status, String, required: true # TODO enum type?

    field :invitation, Types::Invitation, null: true

    def resolve(id:, status:)
      invitation = Invitation.where(user: context[:current_user]).find(id)
      invitation.update!(status: status)
      {invitation: invitation}
    end
  end
end