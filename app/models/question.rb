class Question < ApplicationRecord
  has_and_belongs_to_many :quizzes
  has_many :questions_quizzes
  has_many :votes, through: :questions_quizzes
end
