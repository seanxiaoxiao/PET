
namespace :db do

  desc "empty the database by reloading the schema"
  task :empty do
    Rake::Task["db:schema:load"].invoke
  end

  desc "Fill database with sample data"
  task :populate => :environment do
    make_lifecycles
    make_lifecycle_phases
    make_fake_projects
  end

  desc "re-populate the database with sample data"
  task :repopulate => [:empty, :populate] do
    puts "Database has been repopulated!"
  end

end

def make_lifecycles
  FactoryGirl.create(:lifecycle, {:name => "Waterfall", :description => I18n.t('waterfall_description')})
  FactoryGirl.create(:lifecycle, {:name => "Scrum", :description => I18n.t('scrum_description')})
  FactoryGirl.create(:lifecycle, {:name => "XP", :description => I18n.t('xp_description')})
  FactoryGirl.create(:lifecycle, {:name => "RUP", :description => I18n.t('rup_description')})
  FactoryGirl.create(:lifecycle, {:name => "RAD", :description => I18n.t('rad_description')})
end

def make_lifecycle_phases
  Lifecycle.all.each do |lifecycle|
    FactoryGirl.create(:lifecycle_phase, {:name => "Requirements Phase", :description => I18n.t('requirements_phase_description'), :lifecycle => lifecycle})
    FactoryGirl.create(:lifecycle_phase, {:name => "Design Phase", :description => I18n.t('design_phase_description'), :lifecycle => lifecycle})
    FactoryGirl.create(:lifecycle_phase, {:name => "Development Phase", :description => I18n.t('development_phase_description'), :lifecycle => lifecycle})
    FactoryGirl.create(:lifecycle_phase, {:name => "Test Phase", :description => I18n.t('test_phase_description'), :lifecycle => lifecycle})
    FactoryGirl.create(:lifecycle_phase, {:name => "Deploy Phase", :description => I18n.t('deploy_phase_description'), :lifecycle => lifecycle})
  end
end

def make_fake_projects
  5.times do
    lifecycle = Lifecycle.order("RANDOM()").first
    FactoryGirl.create(:project, {:lifecycle => lifecycle})
  end
end