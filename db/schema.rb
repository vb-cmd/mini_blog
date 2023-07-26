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

ActiveRecord::Schema[7.0].define(version: 20_230_726_094_539) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'action_text_rich_texts', force: :cascade do |t|
    t.string 'name', null: false
    t.text 'body'
    t.string 'record_type', null: false
    t.bigint 'record_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index %w[record_type record_id name], name: 'index_action_text_rich_texts_uniqueness', unique: true
  end

  create_table 'active_storage_attachments', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'record_type', null: false
    t.bigint 'record_id', null: false
    t.bigint 'blob_id', null: false
    t.datetime 'created_at', null: false
    t.index ['blob_id'], name: 'index_active_storage_attachments_on_blob_id'
    t.index %w[record_type record_id name blob_id], name: 'index_active_storage_attachments_uniqueness',
                                                    unique: true
  end

  create_table 'active_storage_blobs', force: :cascade do |t|
    t.string 'key', null: false
    t.string 'filename', null: false
    t.string 'content_type'
    t.text 'metadata'
    t.string 'service_name', null: false
    t.bigint 'byte_size', null: false
    t.string 'checksum'
    t.datetime 'created_at', null: false
    t.index ['key'], name: 'index_active_storage_blobs_on_key', unique: true
  end

  create_table 'active_storage_variant_records', force: :cascade do |t|
    t.bigint 'blob_id', null: false
    t.string 'variation_digest', null: false
    t.index %w[blob_id variation_digest], name: 'index_active_storage_variant_records_uniqueness', unique: true
  end

  create_table 'categories', force: :cascade do |t|
    t.string 'meta_title'
    t.string 'meta_description'
    t.string 'meta_keywords'
    t.string 'title'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'comments', force: :cascade do |t|
    t.text 'body', null: false
    t.boolean 'published', default: false
    t.bigint 'post_id', null: false
    t.bigint 'user_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['post_id'], name: 'index_comments_on_post_id'
    t.index ['user_id'], name: 'index_comments_on_user_id'
  end

  create_table 'likes', force: :cascade do |t|
    t.bigint 'user_id', null: false
    t.string 'record_type', null: false
    t.bigint 'record_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index %w[record_type record_id], name: 'index_likes_on_record'
    t.index ['user_id'], name: 'index_likes_on_user_id'
  end

  create_table 'pages', force: :cascade do |t|
    t.string 'meta_title'
    t.string 'meta_description'
    t.string 'meta_keywords'
    t.string 'title'
    t.boolean 'published', default: true
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'posts', force: :cascade do |t|
    t.string 'meta_title'
    t.string 'meta_description'
    t.string 'meta_keywords'
    t.string 'title'
    t.boolean 'published', default: true
    t.boolean 'comments_enabled', default: true
    t.bigint 'category_id'
    t.integer 'likes_count', default: 0
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.bigint 'user_id'
    t.index ['category_id'], name: 'index_posts_on_category_id'
    t.index ['user_id'], name: 'index_posts_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'name', null: false
    t.text 'body'
    t.integer 'role', default: 0
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['name'], name: 'index_users_on_name', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'active_storage_attachments', 'active_storage_blobs', column: 'blob_id'
  add_foreign_key 'active_storage_variant_records', 'active_storage_blobs', column: 'blob_id'
  add_foreign_key 'comments', 'posts'
  add_foreign_key 'comments', 'users'
  add_foreign_key 'likes', 'users'
  add_foreign_key 'posts', 'categories'
  add_foreign_key 'posts', 'users'
end
