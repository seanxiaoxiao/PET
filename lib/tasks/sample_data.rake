
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
  waterfall = Lifecycle.find_by_name("Waterfall")
  FactoryGirl.create(:lifecycle_phase, {:name => "Requirements Phase", :description => I18n.t('waterfall_requirements_phase_description'), :lifecycle => waterfall})
  FactoryGirl.create(:lifecycle_phase, {:name => "Design Phase", :description => I18n.t('waterfall_design_phase_description'), :lifecycle => waterfall})
  FactoryGirl.create(:lifecycle_phase, {:name => "Development Phase", :description => I18n.t('waterfall_development_phase_description'), :lifecycle => waterfall})
  FactoryGirl.create(:lifecycle_phase, {:name => "Test Phase", :description => I18n.t('waterfall_test_phase_description'), :lifecycle => waterfall})
  FactoryGirl.create(:lifecycle_phase, {:name => "Deploy Phase", :description => I18n.t('waterfall_deploy_phase_description'), :lifecycle => waterfall})
  FactoryGirl.reload

  scrum = Lifecycle.find_by_name("Scrum")
  FactoryGirl.create(:lifecycle_phase, {:name => "Exploration Phase", :description => I18n.t('scrum_exploration_phase_description'), :lifecycle => scrum})
  FactoryGirl.create(:lifecycle_phase, {:name => "Planning Phase", :description => I18n.t('scrum_planning_phase_description'), :lifecycle => scrum})
  FactoryGirl.create(:lifecycle_phase, {:name => "Sprint", :description => I18n.t('scrum_sprint_phase_description'), :lifecycle => scrum})
  FactoryGirl.create(:lifecycle_phase, {:name => "Review Phase", :description => I18n.t('scrum_review_phase_description'), :lifecycle => scrum})
  FactoryGirl.reload

  xp = Lifecycle.find_by_name("XP")
  FactoryGirl.create(:lifecycle_phase, {:name => "Exploration Phase", :description => I18n.t('xp_exploration_phase_description'), :lifecycle => xp})
  FactoryGirl.create(:lifecycle_phase, {:name => "Planning Phase", :description => I18n.t('xp_planning_phase_description'), :lifecycle => xp})
  FactoryGirl.create(:lifecycle_phase, {:name => "Iteration", :description => I18n.t('xp_iteration_phase_description'), :lifecycle => xp})
  FactoryGirl.create(:lifecycle_phase, {:name => "Review Phase", :description => I18n.t('xp_review_phase_description'), :lifecycle => xp})
  FactoryGirl.reload

  rup = Lifecycle.find_by_name("RUP")
  FactoryGirl.create(:lifecycle_phase, {:name => "Inception Phase", :description => I18n.t('rup_inception_phase_description'), :lifecycle => rup})
  FactoryGirl.create(:lifecycle_phase, {:name => "Elaboration Phase", :description => I18n.t('rup_elaboration_phase_description'), :lifecycle => rup})
  FactoryGirl.create(:lifecycle_phase, {:name => "Construction Phase", :description => I18n.t('rup_construction_phase_description'), :lifecycle => rup})
  FactoryGirl.create(:lifecycle_phase, {:name => "Transition Phase", :description => I18n.t('rup_transition_phase_description'), :lifecycle => rup})
  FactoryGirl.reload

  rad = Lifecycle.find_by_name("RAD")
  FactoryGirl.create(:lifecycle_phase, {:name => "Requirements Planning Phase", :description => I18n.t('rad_requirements_planning_phase_description'), :lifecycle => rad})
  FactoryGirl.create(:lifecycle_phase, {:name => "User design Phase", :description => I18n.t('rad_user_design_phase_description'), :lifecycle => rad})
  FactoryGirl.create(:lifecycle_phase, {:name => "Construction Phase", :description => I18n.t('rad_construction_phase_description'), :lifecycle => rad})
  FactoryGirl.create(:lifecycle_phase, {:name => "Cutover Phase", :description => I18n.t('rad_cutover_phase_description'), :lifecycle => rad})
  FactoryGirl.reload

end

def make_fake_projects
  5.times do
    lifecycle = Lifecycle.order("RANDOM()").first
    FactoryGirl.create(:project, {:lifecycle => lifecycle})
  end
end