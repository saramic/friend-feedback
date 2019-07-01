class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions, id: :uuid do |t|
      t.string :text

      t.timestamps
    end
  end
end
