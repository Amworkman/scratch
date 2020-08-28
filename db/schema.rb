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

ActiveRecord::Schema.define(version: 2020_08_28_181819) do

  create_table "artist_records", force: :cascade do |t|
    t.integer "artist_id"
    t.integer "record_id"
    t.index ["artist_id"], name: "index_artist_records_on_artist_id"
    t.index ["record_id"], name: "index_artist_records_on_record_id"
  end

  create_table "artists", force: :cascade do |t|
    t.string "name"
  end

  create_table "genres", force: :cascade do |t|
    t.string "style"
    t.integer "record_id"
    t.index ["record_id"], name: "index_genres_on_record_id"
  end

  create_table "identifiers", force: :cascade do |t|
    t.string "type_of_info"
    t.string "value"
    t.string "description"
    t.integer "record_id"
    t.index ["record_id"], name: "index_identifiers_on_record_id"
  end

  create_table "label_records", force: :cascade do |t|
    t.integer "label_id"
    t.integer "record_id"
    t.index ["label_id"], name: "index_label_records_on_label_id"
    t.index ["record_id"], name: "index_label_records_on_record_id"
  end

  create_table "labels", force: :cascade do |t|
    t.string "name"
  end

  create_table "records", force: :cascade do |t|
    t.string "title"
    t.string "image_url"
    t.string "release_date"
    t.string "lowest_price"
    t.string "num_for_sale"
    t.string "thumb"
  end

  create_table "tracks", force: :cascade do |t|
    t.string "title"
    t.string "duration"
    t.integer "record_id"
    t.index ["record_id"], name: "index_tracks_on_record_id"
  end

  create_table "user_records", force: :cascade do |t|
    t.integer "record_id"
    t.integer "user_id"
    t.string "purchase_price"
    t.index ["record_id"], name: "index_user_records_on_record_id"
    t.index ["user_id"], name: "index_user_records_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
  end

  create_table "videos", force: :cascade do |t|
    t.string "title"
    t.string "uri"
    t.string "description"
    t.integer "duration"
    t.boolean "embeded"
    t.integer "record_id"
    t.index ["record_id"], name: "index_videos_on_record_id"
  end

end
