# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_12_02_094154) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.bigint "option_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "party_quiz_id"
    t.index ["option_id"], name: "index_answers_on_option_id"
    t.index ["party_quiz_id"], name: "index_answers_on_party_quiz_id"
    t.index ["user_id"], name: "index_answers_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
  end

  create_table "challenges", force: :cascade do |t|
    t.integer "duration"
    t.integer "step_number"
    t.integer "points_by_step"
    t.string "title"
    t.text "description"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_challenges_on_category_id"
  end

  create_table "options", force: :cascade do |t|
    t.string "title"
    t.boolean "is_right"
    t.bigint "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_options_on_question_id"
  end

  create_table "party_challenges", force: :cascade do |t|
    t.integer "point"
    t.bigint "user_id"
    t.bigint "challenge_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["challenge_id"], name: "index_party_challenges_on_challenge_id"
    t.index ["user_id"], name: "index_party_challenges_on_user_id"
  end

  create_table "party_quizzes", force: :cascade do |t|
    t.integer "party_points", default: 0
    t.integer "position_in_quiz", default: 0
    t.boolean "done", default: false
    t.bigint "quiz_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["quiz_id"], name: "index_party_quizzes_on_quiz_id"
    t.index ["user_id"], name: "index_party_quizzes_on_user_id"
  end

  create_table "pg_search_documents", force: :cascade do |t|
    t.text "content"
    t.string "searchable_type"
    t.bigint "searchable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["searchable_type", "searchable_id"], name: "index_pg_search_documents_on_searchable_type_and_searchable_id"
  end

  create_table "places", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
  end

  create_table "questions", force: :cascade do |t|
    t.string "title"
    t.bigint "quiz_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["quiz_id"], name: "index_questions_on_quiz_id"
  end

  create_table "quizzes", force: :cascade do |t|
    t.integer "points_by_question"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "category_id"
    t.string "title"
    t.string "description"
    t.index ["category_id"], name: "index_quizzes_on_category_id"
  end

  create_table "tips", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "category_id"
    t.index ["category_id"], name: "index_tips_on_category_id"
    t.index ["user_id"], name: "index_tips_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.integer "level", default: 0
    t.integer "total_point", default: 0
    t.string "photo", default: "https://www.trzcacak.rs/myfile/detail/385-3856300_no-avatar-png.png"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "votes", force: :cascade do |t|
    t.string "kind"
    t.bigint "tip_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tip_id"], name: "index_votes_on_tip_id"
    t.index ["user_id"], name: "index_votes_on_user_id"
  end

  add_foreign_key "answers", "options"
  add_foreign_key "answers", "party_quizzes"
  add_foreign_key "answers", "users"
  add_foreign_key "challenges", "categories"
  add_foreign_key "options", "questions"
  add_foreign_key "party_challenges", "challenges"
  add_foreign_key "party_challenges", "users"
  add_foreign_key "party_quizzes", "quizzes"
  add_foreign_key "party_quizzes", "users"
  add_foreign_key "questions", "quizzes"
  add_foreign_key "quizzes", "categories"
  add_foreign_key "tips", "categories"
  add_foreign_key "tips", "users"
  add_foreign_key "votes", "tips"
  add_foreign_key "votes", "users"
end
