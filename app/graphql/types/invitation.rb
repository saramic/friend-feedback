module Types
  class Invitation < Types::BaseObject
    field :id, ID, null: false
    field :status, String, null: true
    field :quiz_name, String, null: true
  end
end