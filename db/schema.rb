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

ActiveRecord::Schema.define(version: 20170706073042) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "plperl"
  enable_extension "plperlu"
  enable_extension "plpython3u"
  enable_extension "plpythonu"
  enable_extension "adminpack"
  enable_extension "chkpass"
  enable_extension "dblink"
  enable_extension "file_fdw"
  enable_extension "fuzzystrmatch"
  enable_extension "intarray"
  enable_extension "pg_buffercache"
  enable_extension "pg_freespacemap"
  enable_extension "pg_trgm"
  enable_extension "pgcrypto"
  enable_extension "pgrowlocks"
  enable_extension "pgstattuple"
  enable_extension "sslinfo"
  enable_extension "tablefunc"
  enable_extension "pg_stat_statements"

  create_table "access_permissions", id: :serial, force: :cascade do |t|
    t.string "portal_activity", limit: 255
    t.string "account_type", limit: 255, null: false
    t.integer "role_id", null: false
    t.boolean "allowed", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "portal_page_id"
  end

  create_table "account_preferences", id: :serial, force: :cascade do |t|
    t.string "rpx_id"
    t.boolean "assertions_enabled", default: false, null: false
    t.boolean "prior_art_download_enabled", default: true, null: false
    t.boolean "can_view_prior_art", default: false, null: false
    t.datetime "created_at", default: -> { "now()" }
    t.datetime "updated_at", default: -> { "now()" }
    t.index ["rpx_id"], name: "index_account_preferences_on_rpx_id"
  end

  create_table "activation_tokens", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.string "value", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "redeemed", default: false
  end

  create_table "activity_tracking_logs", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.string "page_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "path"
    t.index ["page_type"], name: "index_activity_tracking_logs_on_page_type"
    t.index ["user_id"], name: "index_activity_tracking_logs_on_user_id"
  end

  create_table "alert_announcements", id: :serial, force: :cascade do |t|
    t.text "comment"
    t.date "send_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "alert_email_delivery_logs", id: :serial, force: :cascade do |t|
    t.integer "user_id", null: false
    t.text "content"
    t.date "send_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "subject"
    t.boolean "success", default: false
    t.integer "total_time"
    t.boolean "failure", default: false
    t.integer "send_hour"
  end

  create_table "braintree_webhook_events", id: :serial, force: :cascade do |t|
    t.string "bt_signature", limit: 255
    t.text "bt_payload"
    t.string "kind", limit: 255
    t.string "subscription_token", limit: 255
    t.string "customer_token", limit: 255
    t.string "transaction_token", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text "notes"
    t.index ["kind"], name: "index_braintree_webhook_events_on_kind"
  end

  create_table "browser_stats", id: false, force: :cascade do |t|
    t.serial "id", null: false
    t.integer "user_id", null: false
    t.string "name", limit: 255
    t.string "version", limit: 255
    t.string "full_version", limit: 255
    t.string "operating_system", limit: 255
    t.string "ip_address", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text "user_agent_text"
  end

  create_table "captcha_whitelists", id: :serial, force: :cascade do |t|
    t.string "created_by", limit: 255, null: false
    t.string "ip", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cost_analytics_templates", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "charts", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "custom_alert_delivery_logs", id: :serial, force: :cascade do |t|
    t.integer "user_id", null: false
    t.datetime "send_time", null: false
    t.string "alert_type", limit: 255, null: false
    t.string "status", limit: 255, default: "STARTED"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text "event_master_ids", default: [], array: true
    t.index ["user_id"], name: "index_custom_alert_delivery_logs_on_user_id"
  end

  create_table "daily_alert_delivery_logs", id: :serial, force: :cascade do |t|
    t.datetime "send_time", null: false
    t.datetime "from_time"
    t.datetime "to_time"
    t.string "status", default: "STARTED"
    t.integer "user_ids", default: [], array: true
    t.string "event_master_ids", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["send_time"], name: "index_daily_alert_delivery_logs_on_send_time"
  end

  create_table "daily_transfer_alert_delivery_logs", id: :serial, force: :cascade do |t|
    t.datetime "sent_at"
    t.datetime "from_time"
    t.datetime "to_time"
    t.string "status", default: "STARTED"
    t.integer "user_ids", default: [], array: true
    t.string "event_docket_ids", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sent_at"], name: "index_daily_transfer_alert_delivery_logs_on_sent_at"
  end

  create_table "dashboard_tiles", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.string "url", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "deal_annotations", id: :serial, force: :cascade do |t|
    t.integer "deal_id", null: false
    t.text "summary"
    t.text "additional_details"
    t.text "npe_threat"
  end

  create_table "deal_market_sector_technologies", id: :integer, default: -> { "nextval('deal_technologies_id_seq'::regclass)" }, force: :cascade do |t|
    t.integer "deal_market_sector_id", null: false
    t.integer "technology_id", null: false
    t.integer "percent_relevance", null: false
  end

  create_table "deal_market_sectors", id: :serial, force: :cascade do |t|
    t.integer "deal_id", null: false
    t.integer "market_sector_type_id", null: false
    t.integer "percent_relevance", null: false
  end

  create_table "deal_representative_claims", id: :integer, default: -> { "nextval('deal_claims_id_seq'::regclass)" }, force: :cascade do |t|
    t.integer "deal_id", null: false
    t.string "stripped_patnum", limit: 255
    t.string "app_num_us", limit: 255
    t.text "annotated_claim_text"
    t.string "claim_num", limit: 255
    t.text "description"
  end

  create_table "doc_downloads_logs", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.string "tier", limit: 255
    t.integer "doc_id", null: false
    t.string "doc_type", limit: 255
    t.boolean "is_new", default: false
    t.integer "total_pages", default: 0
    t.integer "billable_pages", default: 0
    t.decimal "cost", default: "0.0"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "failed_download", default: false
    t.integer "status_code"
    t.boolean "credit_purchase", default: false
    t.boolean "skip_count", default: false
    t.string "ip"
    t.index ["doc_id"], name: "index_doc_downloads_logs_on_doc_id"
    t.index ["user_id"], name: "index_doc_downloads_logs_on_user_id"
  end

  create_table "docket_update_weekly_averages", id: :integer, default: nil, force: :cascade do |t|
    t.integer "ent_id", null: false
    t.integer "max_weekly_sig_update_days"
    t.float "avg_weekly_sig_update_days"
    t.integer "rounded_weekly_sig_update_days"
  end

  create_table "email_failures", id: :serial, force: :cascade do |t|
    t.integer "email_id"
    t.integer "user_ids", array: true
    t.boolean "can_view_patents"
    t.string "portal_type", limit: 255
    t.string "user_type", limit: 255, default: "User"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "email_subscribers", id: :serial, force: :cascade do |t|
    t.string "first_name", limit: 255
    t.string "last_name", limit: 255
    t.string "email", limit: 255
    t.boolean "lit_email_subscription", default: true
    t.boolean "news_email_subscription", default: true
    t.string "description", limit: 255
    t.integer "created_by_user_id"
    t.boolean "can_view_patents", default: true
  end

  create_table "emailed_feed_articles", id: :serial, force: :cascade do |t|
    t.integer "email_id"
    t.integer "feed_article_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "guid", limit: 255
  end

  create_table "emailed_litigations", id: :serial, force: :cascade do |t|
    t.integer "email_id"
    t.string "case_key", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "emails", id: :serial, force: :cascade do |t|
    t.datetime "sent_at"
    t.text "commentary"
    t.text "summary_only_case_keys"
    t.integer "email_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "send_date"
    t.datetime "pp_sent_at"
    t.datetime "ps_sent_at"
    t.json "email_json_content"
  end

  create_table "excessive_usage_warning_logs", id: :serial, force: :cascade do |t|
    t.integer "user_id", null: false
    t.datetime "send_date", null: false
    t.string "page_type", limit: 255, null: false
    t.string "status", limit: 255, default: "STARTED"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["user_id"], name: "index_portal.excessive_usage_warning_logs_on_user_id"
  end

  create_table "extended_user_details", id: :serial, force: :cascade do |t|
    t.integer "user_id", null: false
    t.text "description"
    t.integer "modified_by"
    t.decimal "doc_credit", default: "0.0"
    t.boolean "payment_succeeded"
    t.date "trial_expiration_date"
    t.integer "tier_id"
    t.integer "user_role_id"
    t.string "account_or_tier_id"
    t.string "account_or_tier_type"
    t.string "company"
    t.string "user_type", default: "Default"
    t.string "industry"
    t.datetime "expires_at"
    t.datetime "created_at", default: -> { "now()" }
    t.datetime "updated_at", default: -> { "now()" }
    t.index ["modified_by"], name: "index_extended_user_details_on_modified_by"
    t.index ["user_id"], name: "index_extended_user_details_on_user_id"
  end

  create_table "failed_logins", id: :serial, force: :cascade do |t|
    t.string "ip", limit: 255
    t.integer "failures"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "features", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.integer "level", default: 0
    t.boolean "is_partial_feature", default: false
  end

  create_table "feed_histories", force: :cascade do |t|
    t.integer "rss_feed_id"
    t.json "parameters"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rss_feed_id"], name: "index_feed_histories_on_rss_feed_id"
  end

  create_table "insurance_logs", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "insurance_id"
    t.string "request_type", limit: 255
    t.string "url", limit: 255
    t.text "url_params"
    t.text "response"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "insurances", id: :serial, force: :cascade do |t|
    t.string "user_type", limit: 255
    t.boolean "user_status"
    t.integer "user_id"
    t.string "source", limit: 255, default: "portal", null: false
    t.string "sf_status", limit: 255, null: false
    t.string "salesforce_username", limit: 255
    t.string "inviter", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["user_id"], name: "index_portal.insurances_on_user_id"
  end

  create_table "lca_report_requests", id: :serial, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "lca_request_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "lca_report_id"
    t.date "requested_date"
    t.boolean "request_status", default: false
    t.string "lca_request_type", limit: 255
  end

  create_table "lca_reports", id: :serial, force: :cascade do |t|
    t.integer "campaign_id"
    t.string "title", limit: 255
    t.date "publication_date"
    t.string "file", limit: 255, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lca_reports_plaintiffs", id: false, force: :cascade do |t|
    t.integer "lca_report_id", null: false
    t.integer "plaintiff_id", null: false
    t.index ["lca_report_id", "plaintiff_id"], name: "index_lca_reports_plaintiffs_on_lca_report_id_and_plaintiff_id"
    t.index ["plaintiff_id", "lca_report_id"], name: "index_lca_reports_plaintiffs_on_plaintiff_id_and_lca_report_id"
  end

  create_table "lit_doc_requests", id: :serial, force: :cascade do |t|
    t.string "case_key", limit: 255, null: false
    t.string "added_to_db_queue", limit: 255, default: "N"
    t.integer "lit_doc_id", null: false
    t.integer "document_type_id"
    t.integer "lit_id", null: false
    t.integer "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "member_doc_downloads_logs", id: :serial, force: :cascade do |t|
    t.integer "user_id", null: false
    t.boolean "is_new", default: false
    t.string "tier", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "failed_download", default: false
    t.string "doc_type", limit: 255
    t.integer "status_code"
    t.decimal "cost", default: "0.0"
    t.index ["user_id"], name: "index_member_doc_downloads_logs_on_user_id"
  end

  create_table "mks_ctype_descriptions", id: :serial, force: :cascade do |t|
    t.integer "descriptionable_id"
    t.string "description", limit: 255
    t.string "descriptionable_type", limit: 255
  end

  create_table "npe_profile_requests", id: :serial, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "entity_id", null: false
    t.boolean "request_for_update", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["user_id", "entity_id"], name: "index_npe_profile_requests_on_user_id_and_entity_id"
  end

  create_table "npe_reports", id: :serial, force: :cascade do |t|
    t.string "file", limit: 255, null: false
    t.string "selected_month", limit: 255, null: false
    t.date "publication_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "send_npe_email", default: false
    t.boolean "email_status", default: false
    t.index ["selected_month"], name: "index_npe_reports_on_selected_month", unique: true
  end

  create_table "outreach_emails", id: :serial, force: :cascade do |t|
    t.integer "content_id", null: false
    t.string "title", null: false
    t.string "user_groups"
    t.string "user_roles"
    t.datetime "sent_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "page_name_mappers", id: :serial, force: :cascade do |t|
    t.string "page_path", limit: 255
    t.string "page_name", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payment_customers", id: false, force: :cascade do |t|
    t.string "token", limit: 255, null: false
    t.integer "user_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["token"], name: "index_payment_customers_on_token", unique: true
    t.index ["user_id"], name: "index_payment_customers_on_user_id", unique: true
  end

  create_table "payment_event_types", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.text "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payment_events", id: :serial, force: :cascade do |t|
    t.string "related_token", limit: 255
    t.integer "type_id"
    t.string "token_type", limit: 255
    t.text "details"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["token_type"], name: "index_payment_events_on_token_type"
    t.index ["type_id"], name: "index_payment_events_on_type_id"
  end

  create_table "payment_methods", id: false, force: :cascade do |t|
    t.string "token", limit: 255, null: false
    t.string "customer_token", limit: 255, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["customer_token"], name: "index_payment_methods_on_customer_token"
    t.index ["token"], name: "index_payment_methods_on_token", unique: true
  end

  create_table "payment_plans", id: false, force: :cascade do |t|
    t.string "token", limit: 255, null: false
    t.string "name", limit: 255, null: false
    t.decimal "price", precision: 10, scale: 2, default: "0.0", null: false
    t.integer "user_role_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["name"], name: "index_payment_plans_on_name", unique: true
    t.index ["token"], name: "index_payment_plans_on_token", unique: true
  end

  create_table "portal_pages", id: :serial, force: :cascade do |t|
    t.string "portal_page_name", limit: 255
    t.string "portal_page_uri", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prior_art_pats", id: :serial, force: :cascade do |t|
    t.integer "prior_art_id", null: false
    t.integer "pat_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "prior_art_pats_audit", id: false, force: :cascade do |t|
    t.integer "id"
    t.integer "prior_art_id"
    t.integer "pat_id"
    t.string "action", limit: 32
    t.datetime "created_at", default: -> { "now()" }
    t.string "created_by", limit: 64
  end

  create_table "prior_art_uploads", id: :serial, force: :cascade do |t|
    t.integer "prior_art_id", null: false
    t.string "file", limit: 255, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "prior_art_uploads_audit", id: false, force: :cascade do |t|
    t.integer "id"
    t.integer "prior_art_id"
    t.text "file"
    t.string "action", limit: 32
    t.datetime "created_at", default: -> { "now()" }
    t.string "created_by", limit: 64
  end

  create_table "prior_arts", id: :serial, force: :cascade do |t|
    t.datetime "publication_date", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "campaign_id"
    t.string "report_title", limit: 255
    t.integer "last_modified_by"
  end

  create_table "prior_arts_audit", id: false, force: :cascade do |t|
    t.integer "id"
    t.date "publication_date"
    t.string "action", limit: 32
    t.datetime "created_at", default: -> { "now()" }
    t.string "created_by", limit: 64
  end

  create_table "priorsmart_subscribers", id: :serial, force: :cascade do |t|
    t.string "first_name", limit: 255
    t.string "last_name", limit: 255
    t.string "email", limit: 255, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "lit_email_subscription", default: true
    t.boolean "news_email_subscription", default: true
  end

  create_table "quarterly_risk_reduction_emails", id: :serial, force: :cascade do |t|
    t.integer "quarter", null: false
    t.integer "year", null: false
    t.datetime "sent_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "report_download_tracking_logs", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.string "report_type"
    t.string "report_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["report_name"], name: "index_report_download_tracking_logs_on_report_name"
    t.index ["user_id"], name: "index_report_download_tracking_logs_on_user_id"
  end

  create_table "restricted_page_limits", id: :serial, force: :cascade do |t|
    t.integer "user_role_id"
    t.integer "restricted_page_id"
    t.integer "allowed_limit"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "subscription_level"
    t.index ["restricted_page_id"], name: "index_restricted_page_limits_on_restricted_page_id"
  end

  create_table "restricted_page_views", id: :serial, force: :cascade do |t|
    t.integer "restricted_page_id"
    t.integer "user_id"
    t.date "active_date"
    t.integer "count"
    t.index ["restricted_page_id"], name: "index_restricted_page_views_on_restricted_page_id"
    t.index ["user_id"], name: "index_restricted_page_views_on_user_id"
  end

  create_table "restricted_pages", id: :serial, force: :cascade do |t|
    t.string "controller_name", limit: 255
    t.string "action_name", limit: 255
    t.string "title", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rpx_account_settings", id: :serial, force: :cascade do |t|
    t.boolean "active", default: false, null: false
    t.string "rpx_id", limit: 255, null: false
    t.datetime "created_at", default: -> { "now()" }
    t.datetime "updated_at", default: -> { "now()" }
    t.string "display_name", limit: 10, default: "Client", null: false
    t.boolean "assertions_enabled", default: false, null: false
    t.boolean "prior_art_download_enabled", default: true, null: false
    t.boolean "can_view_prior_art", default: false, null: false
    t.index ["rpx_id"], name: "idx_uniq_rpx_account_settings_rpx_id", unique: true
  end

  create_table "rss_feeds", force: :cascade do |t|
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["url"], name: "index_rss_feeds_on_url"
  end

  create_table "salesforce_failed_transactions", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "saved_pages", id: :serial, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "page_id", null: false
    t.string "page_type", limit: 255, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["user_id"], name: "index_portal.saved_pages_on_user_id"
  end

  create_table "settings", id: :serial, force: :cascade do |t|
    t.string "key", limit: 255
    t.text "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["key"], name: "index_settings_on_key", unique: true
  end

  create_table "subscriptions", id: false, force: :cascade do |t|
    t.string "token", limit: 255, null: false
    t.string "payment_method_token", limit: 255, null: false
    t.string "plan_token", limit: 255, null: false
    t.string "customer_token", limit: 255, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date "start_date"
    t.date "end_date"
    t.index ["customer_token"], name: "index_subscriptions_on_customer_token"
    t.index ["token"], name: "index_subscriptions_on_token", unique: true
  end

  create_table "technologies", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
  end

  create_table "tier_matrices", id: :serial, force: :cascade do |t|
    t.string "title"
    t.string "tooltip_header"
    t.text "tooltip_text"
    t.integer "feature_order"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "learn_more_link"
    t.index ["feature_order"], name: "index_tier_matrices_on_feature_order"
  end

  create_table "tier_matrix_user_roles", id: :serial, force: :cascade do |t|
    t.integer "tier_matrix_id", null: false
    t.integer "user_role_id", null: false
    t.boolean "available", default: false
    t.string "display_text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["tier_matrix_id", "user_role_id"], name: "index_tier_matrix_user_roles_on_tier_matrix_id_and_user_role_id"
  end

  create_table "tiers", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "rpx_id", limit: 255
  end

  create_table "toggleable_feature_tiers", id: :serial, force: :cascade do |t|
    t.integer "toggleable_feature_id"
    t.integer "tier_id"
    t.boolean "enabled", default: false
  end

  create_table "toggleable_features", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
  end

  create_table "transactions", id: false, force: :cascade do |t|
    t.string "token", limit: 255, null: false
    t.string "payment_method_token", limit: 255, null: false
    t.string "subscription_token", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "customer_id", limit: 255
    t.string "merchant_account_id", limit: 255
    t.string "plan_id", limit: 255
    t.decimal "billing_amount", precision: 10, scale: 2, default: "0.0"
    t.decimal "next_billing_amount", precision: 10, scale: 2, default: "0.0"
    t.date "billing_period_start_date"
    t.date "billing_period_end_date"
    t.date "paid_through_date"
    t.integer "billing_day_of_month"
    t.string "status", limit: 255
    t.string "masked_card_number", limit: 255
    t.string "card_type", limit: 255
    t.string "payment_type", limit: 255
    t.boolean "is_refund", default: false
    t.boolean "is_recurring", default: true
    t.string "transaction_type", limit: 255, default: "subscription"
    t.string "country_code", limit: 255
    t.index ["subscription_token"], name: "index_transactions_on_subscription_token"
    t.index ["token"], name: "index_transactions_on_token", unique: true
  end

  create_table "unsubscribe_tokens", id: :serial, force: :cascade do |t|
    t.integer "subscriber_id"
    t.string "value", limit: 255
    t.boolean "redeemed", default: false
    t.string "subscriber_type", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_downloads", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.datetime "download_timestamp"
    t.boolean "skip_count", default: false
  end

  create_table "user_permissions", id: :serial, force: :cascade do |t|
    t.integer "user_id", null: false
    t.boolean "can_view_patents", default: true
    t.boolean "hiding_patents", default: false, null: false
    t.boolean "admin", default: true, null: false
    t.boolean "can_view_assertions", default: true, null: false
    t.boolean "prior_art_download_enabled", default: false, null: false
    t.boolean "can_view_prior_art", default: false, null: false
    t.boolean "accepts_assertions_toc", default: false, null: false
    t.boolean "can_view_cost_analytics", default: false, null: false
    t.boolean "can_view_ptab_cost_analytics", default: false, null: false
    t.integer "subscription_level"
    t.integer "modified_by"
    t.boolean "beta_tester", default: false
    t.boolean "alpha_tester", default: false
    t.datetime "created_at", default: -> { "now()" }
    t.datetime "updated_at", default: -> { "now()" }
    t.index ["modified_by"], name: "index_user_permissions_on_modified_by"
    t.index ["user_id"], name: "index_user_permissions_on_user_id"
  end

  create_table "user_preferences", id: :serial, force: :cascade do |t|
    t.integer "user_id", null: false
    t.boolean "lit_email_subscription", default: true, null: false
    t.datetime "lit_email_last_unsubscribed_on"
    t.boolean "news_email_subscription", default: true, null: false
    t.datetime "news_email_last_unsubscribed_on"
    t.string "selected_plan"
    t.boolean "monthly_npe_update_subscription", default: true
    t.string "dashboard_preferences", default: [], array: true
    t.boolean "subscription_auto_renew", default: true
    t.boolean "quarterly_feature_release_updates", default: true
    t.integer "modified_by"
    t.string "dashboard_defendant_ids"
    t.datetime "created_at", default: -> { "now()" }
    t.datetime "updated_at", default: -> { "now()" }
    t.boolean "quarterly_risk_reduction_report", default: false
    t.boolean "daily_transfer_alert", default: true
    t.index ["modified_by"], name: "index_user_preferences_on_modified_by"
    t.index ["user_id"], name: "index_user_preferences_on_user_id"
  end

  create_table "user_role_activity_logs", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "prev_user_role_id"
    t.integer "new_user_role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["user_id"], name: "index_user_role_activity_logs_on_user_id"
  end

  create_table "user_roles", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.integer "lit_download_limit"
    t.decimal "monthly_doc_credit", precision: 10, scale: 2, default: "0.0"
    t.integer "alert_subscription_limit"
    t.integer "cost_analytics_template_id"
  end

  create_table "user_roles_users", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "user_role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "payment_cycle_time"
    t.index ["user_id"], name: "index_user_roles_users_on_user_id"
    t.index ["user_role_id"], name: "index_user_roles_users_on_user_role_id"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email", limit: 255, default: "", null: false
    t.string "encrypted_password", limit: 255, default: "", null: false
    t.string "reset_password_token", limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip", limit: 255
    t.string "last_sign_in_ip", limit: 255
    t.string "first_name", limit: 40
    t.string "last_name", limit: 40
    t.string "rpx_id", limit: 255
    t.datetime "expires_at"
    t.datetime "last_login"
    t.datetime "last_viewed_homepage_at"
    t.boolean "lit_email_subscription", default: true, null: false
    t.date "lit_email_last_unsubscribed_on"
    t.boolean "news_email_subscription", default: true, null: false
    t.date "news_email_last_unsubscribed_on"
    t.boolean "can_view_patents", default: true
    t.string "crypted_password", limit: 40
    t.string "salt", limit: 40
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "hiding_patents", default: false, null: false
    t.boolean "admin", default: false, null: false
    t.boolean "can_view_assertions", default: true, null: false
    t.string "confirmation_token", limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.integer "tier_id"
    t.string "provider", limit: 255
    t.string "uid", limit: 255
    t.text "notes"
    t.integer "user_role_id"
    t.string "account_or_tier_id", limit: 255
    t.string "account_or_tier_type", limit: 255
    t.string "linkedin_title", limit: 255
    t.string "linkedin_company", limit: 255
    t.boolean "prior_art_download_enabled", default: false, null: false
    t.boolean "can_view_prior_art", default: false, null: false
    t.boolean "accepts_assertions_toc", default: false
    t.string "company", limit: 255
    t.string "user_type", limit: 255, default: "Default"
    t.text "description"
    t.integer "created_by"
    t.boolean "auto_created", default: false
    t.integer "subscription_level"
    t.string "industry", limit: 255
    t.decimal "doc_credit", default: "0.0"
    t.boolean "payment_succeeded"
    t.string "unique_session_id", limit: 255
    t.string "selected_plan", limit: 255
    t.integer "modified_by"
    t.boolean "beta_tester", default: false
    t.boolean "monthly_npe_update_subscription", default: true
    t.string "dashboard_preferences", limit: 255, default: [], array: true
    t.date "trial_expiration_date"
    t.boolean "quarterly_feature_release_updates", default: true
    t.boolean "subscription_auto_renew", default: true
    t.string "dashboard_defendant_ids"
    t.boolean "alpha_tester", default: false
    t.boolean "can_view_cost_analytics", default: false
    t.boolean "can_view_ptab_cost_analytics", default: false
    t.boolean "quarterly_risk_reduction_report", default: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_20jan17", id: false, force: :cascade do |t|
    t.integer "id"
    t.string "email", limit: 255
    t.string "encrypted_password", limit: 255
    t.string "reset_password_token", limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count"
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip", limit: 255
    t.string "last_sign_in_ip", limit: 255
    t.string "first_name", limit: 40
    t.string "last_name", limit: 40
    t.string "rpx_id", limit: 255
    t.datetime "expires_at"
    t.datetime "last_login"
    t.datetime "last_viewed_homepage_at"
    t.boolean "lit_email_subscription"
    t.date "lit_email_last_unsubscribed_on"
    t.boolean "news_email_subscription"
    t.date "news_email_last_unsubscribed_on"
    t.boolean "can_view_patents"
    t.string "crypted_password", limit: 40
    t.string "salt", limit: 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "hiding_patents"
    t.boolean "admin"
    t.boolean "can_view_assertions"
    t.string "confirmation_token", limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.integer "tier_id"
    t.string "provider", limit: 255
    t.string "uid", limit: 255
    t.text "notes"
    t.integer "user_role_id"
    t.string "account_or_tier_id", limit: 255
    t.string "account_or_tier_type", limit: 255
    t.string "linkedin_title", limit: 255
    t.string "linkedin_company", limit: 255
    t.boolean "prior_art_download_enabled"
    t.boolean "can_view_prior_art"
    t.boolean "accepts_assertions_toc"
    t.string "company", limit: 255
    t.string "user_type", limit: 255
    t.text "description"
    t.integer "created_by"
    t.boolean "auto_created"
    t.integer "subscription_level"
    t.string "industry", limit: 255
    t.decimal "doc_credit"
    t.boolean "payment_succeeded"
    t.string "unique_session_id", limit: 255
    t.string "selected_plan", limit: 255
    t.integer "modified_by"
    t.boolean "beta_tester"
    t.boolean "monthly_npe_update_subscription"
    t.string "dashboard_preferences", limit: 255, array: true
    t.date "trial_expiration_date"
    t.boolean "quarterly_feature_release_updates"
  end

  create_table "users_ds_5207", id: false, force: :cascade do |t|
    t.integer "id"
    t.boolean "can_view_ptab_cost_analytics"
  end

  create_table "whitelists", id: :serial, force: :cascade do |t|
    t.string "created_by", limit: 255, null: false
    t.string "email", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "wordpress_emails", id: :serial, force: :cascade do |t|
    t.text "content", null: false
    t.string "subject", limit: 255, null: false
    t.datetime "sent_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
