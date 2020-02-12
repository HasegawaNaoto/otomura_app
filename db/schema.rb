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

ActiveRecord::Schema.define(version: 2020_02_07_020609) do

  create_table "audio_tagmaps", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "audio_id"
    t.bigint "audio_tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["audio_id"], name: "index_audio_tagmaps_on_audio_id"
    t.index ["audio_tag_id"], name: "index_audio_tagmaps_on_audio_tag_id"
  end

  create_table "audio_tags", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "genre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "audios", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.string "title"
    t.string "file"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.index ["user_id"], name: "index_audios_on_user_id"
  end

  create_table "comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "content"
    t.integer "post_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "follows", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "follow_id"
    t.integer "follower_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genders", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "gender"
    t.index ["user_id"], name: "index_genders_on_user_id"
  end

  create_table "genres", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "rock", default: false, null: false
    t.boolean "punk", default: false, null: false
    t.boolean "pop", default: false, null: false
    t.boolean "ambient", default: false, null: false
    t.boolean "alternative", default: false, null: false
    t.boolean "classic", default: false, null: false
    t.boolean "jazz", default: false, null: false
    t.boolean "hard_rock", default: false, null: false
    t.boolean "progressive", default: false, null: false
    t.boolean "pop_punk", default: false, null: false
    t.boolean "heavy_metal", default: false, null: false
    t.boolean "metalcore", default: false, null: false
    t.boolean "merocore", default: false, null: false
    t.boolean "hiphop", default: false, null: false
    t.boolean "instrument", default: false, null: false
    t.boolean "western", default: false, null: false
    t.boolean "japanese", default: false, null: false
    t.boolean "acoustic", default: false, null: false
    t.string "other1", default: ""
    t.string "other2", default: ""
    t.string "other3", default: ""
    t.string "other4", default: ""
    t.string "other5", default: ""
    t.boolean "emo", default: false, null: false
    t.index ["user_id"], name: "index_genres_on_user_id"
  end

  create_table "instruments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "vocal", default: false, null: false
    t.boolean "guiter", default: false, null: false
    t.boolean "bass", default: false, null: false
    t.boolean "drum", default: false, null: false
    t.boolean "key", default: false, null: false
    t.boolean "dj", default: false, null: false
    t.boolean "sax", default: false, null: false
    t.boolean "violin", default: false, null: false
    t.string "other", default: ""
    t.index ["user_id"], name: "index_instruments_on_user_id"
  end

  create_table "likes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "post_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notices", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "user_id"
    t.integer "visited_id"
    t.integer "comment_id"
    t.integer "like_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "friend_id"
    t.integer "friended_id"
    t.boolean "checked", default: false, null: false
    t.integer "follower_id"
  end

  create_table "posts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "comment_id"
    t.string "image1"
    t.bigint "user_id"
    t.string "video"
    t.json "images"
  end

  create_table "prefectures", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.string "area"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_prefectures_on_user_id"
  end

  create_table "serches", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "gender"
    t.boolean "vocal", default: false, null: false
    t.boolean "guiter", default: false, null: false
    t.boolean "bass", default: false, null: false
    t.boolean "drum", default: false, null: false
    t.boolean "key", default: false, null: false
    t.boolean "dj", default: false, null: false
    t.boolean "sax", default: false, null: false
    t.boolean "violin", default: false, null: false
    t.string "other_instrument", default: ""
    t.boolean "emo", default: false, null: false
    t.boolean "rock", default: false, null: false
    t.boolean "punk", default: false, null: false
    t.boolean "pop", default: false, null: false
    t.boolean "ambient", default: false, null: false
    t.boolean "alternative", default: false, null: false
    t.boolean "classic", default: false, null: false
    t.boolean "jazz", default: false, null: false
    t.boolean "hard_rock", default: false, null: false
    t.boolean "progressive", default: false, null: false
    t.boolean "pop_punk", default: false, null: false
    t.boolean "heavy_metal", default: false, null: false
    t.boolean "metalcore", default: false, null: false
    t.boolean "merocore", default: false, null: false
    t.boolean "hiphop", default: false, null: false
    t.boolean "instrument", default: false, null: false
    t.boolean "western", default: false, null: false
    t.boolean "japanese", default: false, null: false
    t.boolean "acoustic", default: false, null: false
    t.string "other_genre", default: ""
    t.string "word", default: ""
    t.string "area"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "uid"
    t.string "provider"
    t.string "name"
    t.string "nickname"
    t.string "location"
    t.string "image"
    t.string "content"
    t.string "background"
    t.string "public_uid"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["public_uid"], name: "index_users_on_public_uid", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "audio_tagmaps", "audio_tags"
  add_foreign_key "audio_tagmaps", "audios"
  add_foreign_key "audios", "users"
  add_foreign_key "genders", "users"
  add_foreign_key "genres", "users"
  add_foreign_key "instruments", "users"
  add_foreign_key "prefectures", "users"
end
