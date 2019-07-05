class Quiz < ApplicationRecord
  belongs_to :organiser, class_name: 'User'
  has_many :invitations
  has_many :users, through: :invitations # invitees
  has_and_belongs_to_many :questions
  has_many :questions_quizzes
end
