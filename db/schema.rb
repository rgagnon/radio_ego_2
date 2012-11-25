# encoding: UTF-8
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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121125185520) do

  create_table "audios", :force => true do |t|
    t.string   "title"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "mp3_file_name"
    t.string   "mp3_content_type"
    t.integer  "mp3_file_size"
    t.datetime "mp3_updated_at"
    t.integer  "user_id"
    t.integer  "listen_count"
  end

  create_table "authentications", :force => true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", :force => true do |t|
    t.string   "description", :limit => 100, :null => false
    t.string   "code",        :limit => 50,  :null => false
    t.integer  "sequence",                   :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "value"
  end

  create_table "comments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "media_id"
    t.text     "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["media_id"], :name => "fk_comments_media"
  add_index "comments", ["user_id"], :name => "fk_comments_user"

  create_table "default_params", :force => true do |t|
  end

  create_table "fast_sessions", :id => false, :force => true do |t|
    t.integer   "session_id_crc",               :null => false
    t.string    "session_id",     :limit => 32, :null => false
    t.timestamp "updated_at",                   :null => false
    t.text      "data"
  end

  add_index "fast_sessions", ["session_id_crc", "session_id"], :name => "session_id", :unique => true
  add_index "fast_sessions", ["updated_at"], :name => "updated_at"

  create_table "follows", :force => true do |t|
    t.string   "follower_type"
    t.integer  "follower_id"
    t.string   "followable_type"
    t.integer  "followable_id"
    t.datetime "created_at"
  end

  add_index "follows", ["followable_id", "followable_type"], :name => "fk_followables"
  add_index "follows", ["follower_id", "follower_type"], :name => "fk_follows"

  create_table "globalize_countries", :force => true do |t|
    t.string "code",                   :limit => 2
    t.string "english_name"
    t.string "date_format"
    t.string "currency_format"
    t.string "currency_code",          :limit => 3
    t.string "thousands_sep",          :limit => 2
    t.string "decimal_sep",            :limit => 2
    t.string "currency_decimal_sep",   :limit => 2
    t.string "number_grouping_scheme"
  end

  add_index "globalize_countries", ["code"], :name => "index_globalize_countries_on_code"

  create_table "globalize_languages", :force => true do |t|
    t.string  "iso_639_1",             :limit => 2
    t.string  "iso_639_2",             :limit => 3
    t.string  "iso_639_3",             :limit => 3
    t.string  "rfc_3066"
    t.string  "english_name"
    t.string  "english_name_locale"
    t.string  "english_name_modifier"
    t.string  "native_name"
    t.string  "native_name_locale"
    t.string  "native_name_modifier"
    t.boolean "macro_language"
    t.string  "direction"
    t.string  "pluralization"
    t.string  "scope",                 :limit => 1
  end

  add_index "globalize_languages", ["iso_639_1"], :name => "index_globalize_languages_on_iso_639_1"
  add_index "globalize_languages", ["iso_639_2"], :name => "index_globalize_languages_on_iso_639_2"
  add_index "globalize_languages", ["iso_639_3"], :name => "index_globalize_languages_on_iso_639_3"
  add_index "globalize_languages", ["rfc_3066"], :name => "index_globalize_languages_on_rfc_3066"

  create_table "globalize_translations", :force => true do |t|
    t.string  "type"
    t.string  "tr_key"
    t.string  "table_name"
    t.integer "item_id"
    t.string  "facet"
    t.boolean "built_in",            :default => true
    t.integer "language_id"
    t.integer "pluralization_index"
    t.text    "text"
    t.string  "namespace"
  end

  add_index "globalize_translations", ["table_name", "item_id", "language_id"], :name => "globalize_translations_table_name_and_item_and_language"
  add_index "globalize_translations", ["tr_key", "language_id"], :name => "index_globalize_translations_on_tr_key_and_language_id"

  create_table "keywords", :force => true do |t|
  end

  create_table "likes", :force => true do |t|
    t.string   "liker_type"
    t.integer  "liker_id"
    t.string   "likeable_type"
    t.integer  "likeable_id"
    t.datetime "created_at"
  end

  add_index "likes", ["likeable_id", "likeable_type"], :name => "fk_likeables"
  add_index "likes", ["liker_id", "liker_type"], :name => "fk_likes"

  create_table "listened_infos", :force => true do |t|
    t.integer  "media_id"
    t.integer  "listened_count"
    t.integer  "listened_real_count"
    t.string   "ip_adresse"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "listened_infos", ["created_at"], :name => "index_created_at"
  add_index "listened_infos", ["media_id"], :name => "index1"

  create_table "medias", :force => true do |t|
    t.integer  "user_id"
    t.integer  "site_id"
    t.integer  "category_id"
    t.integer  "number_listened",                           :default => 0
    t.string   "description",                :limit => 275
    t.string   "duration"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title",                      :limit => 100
    t.integer  "audio_id"
    t.string   "filename"
    t.integer  "size"
    t.string   "content_type"
    t.integer  "rating_value"
    t.string   "keyword"
    t.string   "mpeg_version"
    t.string   "bitrate"
    t.string   "channel_mode"
    t.string   "samplerate"
    t.boolean  "classic"
    t.boolean  "allow_comments"
    t.integer  "number_listened_daily",                     :default => 0
    t.integer  "number_listened_weekly",                    :default => 0
    t.boolean  "delta",                                     :default => true
    t.integer  "user_oauth_id"
    t.string   "locale"
    t.integer  "user_legacy_id"
    t.string   "uploaded_data_file_name"
    t.string   "uploaded_data_content_type"
    t.integer  "uploaded_data_file_size"
    t.datetime "uploaded_data_updated_at"
  end

  add_index "medias", ["category_id"], :name => "fk_medias_cats"
  add_index "medias", ["created_at"], :name => "idx1"
  add_index "medias", ["user_id"], :name => "fk_medias_users"

  create_table "mentions", :force => true do |t|
    t.string   "mentioner_type"
    t.integer  "mentioner_id"
    t.string   "mentionable_type"
    t.integer  "mentionable_id"
    t.datetime "created_at"
  end

  add_index "mentions", ["mentionable_id", "mentionable_type"], :name => "fk_mentionables"
  add_index "mentions", ["mentioner_id", "mentioner_type"], :name => "fk_mentions"

  create_table "play_lists", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "media_id"
    t.integer  "user_id"
    t.string   "play_list_type"
    t.integer  "user_oauth_id"
  end

  create_table "rails_admin_histories", :force => true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 8
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_rails_admin_histories"

  create_table "ratings", :force => true do |t|
    t.integer  "rating",                      :default => 0
    t.datetime "created_at",                                  :null => false
    t.string   "rateable_type", :limit => 15, :default => "", :null => false
    t.integer  "rateable_id",                 :default => 0,  :null => false
    t.integer  "user_id",                     :default => 0,  :null => false
  end

  add_index "ratings", ["rateable_id"], :name => "fk_ratings_media"
  add_index "ratings", ["user_id"], :name => "fk_ratings_user"

  create_table "services", :force => true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.string   "uname"
    t.string   "uemail"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["session_id"], :name => "sesss_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "sites", :force => true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_oauth_id"
  end

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context"
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "user_oauths", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "language"
    t.string   "locale"
  end

  create_table "user_requests", :force => true do |t|
    t.integer  "user_id"
    t.string   "login"
    t.string   "action"
    t.datetime "created_at"
    t.integer  "duration"
    t.string   "session_id"
    t.text     "remote_address"
    t.string   "user_agent",     :limit => 300
  end

  create_table "user_types", :force => true do |t|
    t.string   "code"
    t.string   "description"
    t.integer  "sequence"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "value"
  end

  create_table "users", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "users_bk", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_legacy_id"
  end

  add_index "users_bk", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users_bk", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "users_legacy", :force => true do |t|
    t.string   "login",               :limit => 80
    t.string   "cryptpassword",       :limit => 40
    t.string   "validkey",            :limit => 40
    t.string   "email",               :limit => 100
    t.string   "newemail",            :limit => 100
    t.string   "ipaddr"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "confirmed"
    t.string   "domains"
    t.string   "image"
    t.string   "firstname"
    t.string   "lastname"
    t.date     "dateofbirth"
    t.text     "city"
    t.text     "phone"
    t.boolean  "terms_conditions"
    t.boolean  "news_letters"
    t.integer  "user_type_id"
    t.string   "slogan"
    t.string   "description"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
  end

end
