class Invitation < ApplicationRecord
  belongs_to :user
  belongs_to :quiz

  enum status: { pending: 0, rejected: 1, accepted: 2 }
end
