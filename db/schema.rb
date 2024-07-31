# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_07_18_102412) do
  create_table "answers", force: :cascade do |t|
    t.integer "participant_id", null: false
    t.integer "survey_id", null: false
    t.string "question_id"
    t.string "integer"
    t.string "answered"
    t.string "bool"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["participant_id"], name: "index_answers_on_participant_id"
    t.index ["survey_id"], name: "index_answers_on_survey_id"
  end

  create_table "participants", force: :cascade do |t|
    t.string "name"
    t.datetime "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "surveys", force: :cascade do |t|
    t.string "state"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "answers", "participants"
  add_foreign_key "answers", "surveys"
end
