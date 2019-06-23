class User < ApplicationRecord
  include Clearance::User

  has_many :invitations
  has_many :quizzes, through: :invitations # quiz invites? only if they are pending?
end
