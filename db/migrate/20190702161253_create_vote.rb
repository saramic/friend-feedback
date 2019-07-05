class CreateVote < ActiveRecord::Migration[6.0]
  def change
    create_table :votes, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.references :questions_quiz, null: false, foreign_key: true, type: :uuid
      t.integer :status, null: false
    end

    add_index(:votes, [:user_id, :questions_quiz_id], unique: true)
  end
end
