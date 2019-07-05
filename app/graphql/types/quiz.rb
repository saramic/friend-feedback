module Types
  class Quiz < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: true
    field :organiser, Types::User, null: true
    field :invitations, [Types::Invitation], null: true
    field :questions, [Types::Question], null: true
    field :questions_quizzes, [Types::QuestionsQuiz], null: true
  end
end