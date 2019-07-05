class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :questions_quiz
  has_one :quiz, through: :questions_quiz
  has_one :question, through: :questions_quiz
end
