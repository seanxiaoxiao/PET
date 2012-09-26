namespace :db do

  desc "Runs database migration for the test and development environments"
  task :migrate_all do
    puts "Start test db migration"
    puts `rake db:migrate RAILS_ENV=test`
    puts "Finished test db migration"
    puts "Start development db migration"
    puts `rake db:migrate RAILS_ENV=development`
    puts "Finished development db migration"
  end

end