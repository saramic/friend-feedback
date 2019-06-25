module Types
  class Quiz < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: true
    field :organiser, User, null: true
  end
end