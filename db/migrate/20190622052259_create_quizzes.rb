class CreateQuizzes < ActiveRecord::Migration[6.0]
  def change
    create_table :quizzes, id: :uuid do |t|
      t.string :title, null: false
      t.references :organiser, index: true, null: false, type: :uuid, foregin_key: { to_table: :users }

      t.timestamps
    end
  end
end
