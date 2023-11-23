# exit on error
set -o errexit

bundle install
bundle exec rails db:seed
bundle exec rails db:migrate