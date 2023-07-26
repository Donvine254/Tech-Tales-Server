#!/usr/bin/env ruby

def run_command(command)
    system(command)
  end
  
  run_command('bundle install')
  run_command('bundle exec rake db:migrate')
  run_command('bundle exec puma')
