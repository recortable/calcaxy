# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_calcaxy_session',
  :secret      => '56bad629b0af11cb43a5c2a35ca374e233698e8de2affc2a751cd149e1fa7203486857fd7326cd1b1fbc55a8d185885d77895250e70e393c8033d126b0f56d97'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
