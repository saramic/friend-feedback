module Types
  class Vote < Types::BaseObject
    field :id, ID, null: false
    field :status, String, null: false
    field :user_id, ID, null: false # TODO temporary, should scope to user
    field :user, User, null: false # TODO temporary, should scope to user
  end
end