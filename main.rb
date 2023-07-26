#!/usr/bin/env ruby

def run_command(command)
    system(command)
  end
  
  run_command('bundle install')
  run_command('rake db:migrate')
