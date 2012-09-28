namespace :db do

  desc "empty the database by reloading the schema"
  task :empty do
    Rake::Task["db:schema:load"].invoke
  end

  desc "Fill database with sample data"
  task :populate => :environment do
    make_lifecycles
    make_fake_projects
  end

  desc "re-populate the database with sample data"
  task :repopulate => [:empty, :populate] do
    puts "Database has been repopulated!"
  end

end

def make_lifecycles
  FactoryGirl.create(:lifecycle, {:name => "Waterfall", :description => "Waterfall lifecycle"})
  FactoryGirl.create(:lifecycle, {:name => "Scrum", :description => "Scrum lifecycle"})
  FactoryGirl.create(:lifecycle, {:name => "XP", :description => "XP lifecycle"})
end

def make_fake_projects
  5.times do
    lifecycle = Lifecycle.order("RANDOM()").first
    FactoryGirl.create(:project, { :lifecycle => lifecycle })
  end
end