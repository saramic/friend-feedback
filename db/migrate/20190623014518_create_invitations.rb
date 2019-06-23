class CreateInvitations < ActiveRecord::Migration[6.0]
  def change
    create_table :invitations, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.references :quiz, null: false, foreign_key: true, type: :uuid
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
