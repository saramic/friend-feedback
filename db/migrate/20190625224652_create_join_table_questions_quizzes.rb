class CreateJoinTableQuestionsQuizzes < ActiveRecord::Migration[6.0]
  def change
    create_table :questions_quizzes, id: :uuid do |t|
      t.references :quiz, null: false, foreign_key: true, type: :uuid
      t.references :question, null: false, foreign_key: true, type: :uuid
      # t.index [:quiz_id, :question_id]
      # t.index [:question_id, :quiz_id]
    end
  end
end
