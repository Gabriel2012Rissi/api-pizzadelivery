#!/bin/sh

set -e

# Generate a new master.key if one doesn't exist
if [ ${RAILS_ENV} = "production" ] && [ ! -f ${RAILS_DIR}/config/master.key ]; then
  echo "Generating master.key..."
  EDITOR="nano --wait" bundle exec rails credentials:edit
fi

# Remove a potentially pre-existing server.pid for Rails.
rm -f ${RAILS_DIR}/tmp/pids/server.pid

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
