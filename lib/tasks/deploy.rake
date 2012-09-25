namespace :heroku do

  task :reset => [:deploy, "heroku:db:reset", "heroku:db:populate"] do

  end

  task :deploy => [:environment] do
    #Push source to heroku
    puts `git push heroku master`
  end

  task :heroku_show do
    #Load the remote site in the browser
    puts `heroku open`
  end

  namespace :db do

    task :reset do
      puts `heroku pg:reset DATABASE --confirm quatsch`
      puts `heroku run rake db:schema:load`
    end

    task :populate do
      #Load sample data
      puts `heroku run rake db:populate`
      #Restarts the heroku application
      puts `heroku restart`
    end

  end
end