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

ActiveRecord::Schema.define(version: 2019_11_13_180410) do

  create_table "representatives", force: :cascade do |t|
    t.string "proPublica_id"
    t.string "short_title"
    t.string "first_name"
    t.string "last_name"
    t.string "middle_name"
    t.string "ocd_id"
    t.string "twitter_account"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "representatives_users", id: false, force: :cascade do |t|
    t.integer "representative_id", null: false
    t.integer "user_id", null: false
    t.index ["representative_id", "user_id"], name: "index_representatives_users_on_representative_id_and_user_id"
    t.index ["user_id", "representative_id"], name: "index_representatives_users_on_user_id_and_representative_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
