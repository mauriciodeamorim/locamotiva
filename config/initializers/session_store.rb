# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_locarunners_session',
  :secret      => '8b94fc717a20e43eece691b5cee8ac98980083c1b4185fcf9b28afa4a28f7eab46118c1ca0df11c8661f0e7f7e0d8966f1918b46f0d6cbeaac002dce77de202e'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
