# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_07_02_161253) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "invitations", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "user_id", null: false
    t.uuid "quiz_id", null: false
    t.integer "status", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["quiz_id"], name: "index_invitations_on_quiz_id"
    t.index ["user_id"], name: "index_invitations_on_user_id"
  end

  create_table "questions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "text"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "questions_quizzes", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "quiz_id", null: false
    t.uuid "question_id", null: false
    t.index ["question_id"], name: "index_questions_quizzes_on_question_id"
    t.index ["quiz_id"], name: "index_questions_quizzes_on_quiz_id"
  end

  create_table "quizzes", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "title", null: false
    t.uuid "organiser_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["organiser_id"], name: "index_quizzes_on_organiser_id"
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email", null: false
    t.string "encrypted_password", limit: 128, null: false
    t.string "confirmation_token", limit: 128
    t.string "remember_token", limit: 128, null: false
    t.string "handle"
    t.index ["email"], name: "index_users_on_email"
    t.index ["handle"], name: "index_users_on_handle", unique: true
    t.index ["remember_token"], name: "index_users_on_remember_token"
  end

  create_table "votes", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "user_id", null: false
    t.uuid "questions_quiz_id", null: false
    t.integer "status", null: false
    t.index ["questions_quiz_id"], name: "index_votes_on_questions_quiz_id"
    t.index ["user_id", "questions_quiz_id"], name: "index_votes_on_user_id_and_questions_quiz_id", unique: true
    t.index ["user_id"], name: "index_votes_on_user_id"
  end

  add_foreign_key "invitations", "quizzes"
  add_foreign_key "invitations", "users"
  add_foreign_key "questions_quizzes", "questions"
  add_foreign_key "questions_quizzes", "quizzes"
  add_foreign_key "votes", "questions_quizzes"
  add_foreign_key "votes", "users"
end
