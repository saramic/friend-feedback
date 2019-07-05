module Types
  class QuestionsQuiz < Types::BaseObject
    field :quiz_id, ID, null: false
    field :question_id, ID, null: false
    field :votes, [Types::Vote], null: true
  end
end