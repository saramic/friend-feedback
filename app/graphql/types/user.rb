module Types
  class User < Types::BaseObject
    field :id, ID, null: false
    field :handle, String, null: true
  end
end