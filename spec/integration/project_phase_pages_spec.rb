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
    it { should have_content(lifecycle_phase_1.name) }
    it { should have_content(lifecycle_phase_2.name) }
    it { should have_content(lifecycle_phase_3.name) }

  end
end