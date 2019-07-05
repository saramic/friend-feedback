class QuestionsQuiz < ApplicationRecord
  has_many :votes
  belongs_to :question
  belongs_to :quiz
end
