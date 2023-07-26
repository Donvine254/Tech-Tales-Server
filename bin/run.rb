#!/usr/bin/env ruby

def run_command(command)
    system(command)
  end
  
  run_command('rake db:migrate')
  run_command('rake server')