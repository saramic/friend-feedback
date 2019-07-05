module Mutations
  class VoteOnQuestion < Mutations::BaseMutation
    argument :quiz_id, ID, required: true
    argument :question_id, ID, required: true
    argument :status, Int, required: true

    field :vote, Types::Vote, null: true

    def resolve(question_id:, quiz_id:, status:)
      questions_quiz = ::QuestionsQuiz.find_by(question_id: question_id, quiz_id: quiz_id)
      vote = ::Vote.create!(questions_quiz: questions_quiz, status: status, user: context[:current_user])
      {
        vote: vote
      }
    end
  end
end