require 'spec_helper'

describe "Project Phase pages" do

  subject { page }
  let!(:lifecycle) { FactoryGirl.create(:lifecycle) }
  let!(:lifecycle_phase_1) { FactoryGirl.create(:lifecycle_phase, :lifecycle => lifecycle) }
  let!(:lifecycle_phase_2) { FactoryGirl.create(:lifecycle_phase, :lifecycle => lifecycle) }
  let!(:lifecycle_phase_3) { FactoryGirl.create(:lifecycle_phase, :lifecycle => lifecycle) }
  let!(:project) { FactoryGirl.create(:project, :lifecycle => lifecycle) }

  describe "Access the project phases in a project" do

    before do
      visit project_project_phases_path(project)
    end

    it { should have_content('Project Phases') }
    it { should have_link(lifecycle_phase_1.name) }
    it { should have_link(lifecycle_phase_2.name) }
    it { should have_link(lifecycle_phase_3.name) }

  end

  describe "view a project phase" do

    before do
      visit project_project_phase_path(project, project.project_phases[0])
    end

    it { should have_link('All Phases') }
    it { should have_content(project.project_phases[0].lifecycle_phase.name) }
    it { should have_content(project.project_phases[0].lifecycle_phase.description) }
    it { should have_content(project.project_phases[0].lifecycle_phase.sequence) }

  end
end