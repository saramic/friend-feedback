class Quiz < ApplicationRecord
  belongs_to :organiser, class_name: 'User'
  has_many :invitations
  has_many :users, through: :invitations # invitees
end
