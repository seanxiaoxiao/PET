require 'spec_helper'

describe "Deliverable pages" do

  subject { page }

  let!(:lifecycle) { FactoryGirl.create(:lifecycle) }
  let!(:lifecycle_phase) { FactoryGirl.create(:lifecycle_phase, :lifecycle => lifecycle) }
  let!(:project) { FactoryGirl.create(:project, :lifecycle => lifecycle) }
  let!(:deliverable) { FactoryGirl.create(:deliverable, :project_phase => project.project_phases.first) }

  let!(:complexity) { FactoryGirl.create(:complexity) }
  let!(:deliverable_type) { FactoryGirl.create(:deliverable_type) }
  let!(:valid_deliverable_attributes) do
    {:deliverable => {
        :name => "Test Title",
        :description => "Test content",
        :complexity_id => complexity.id,
        :deliverable_type_id => deliverable_type.id
    }}
  end

  describe "making a new deliverable" do
    before do
      visit new_project_project_phase_deliverable_path(project, project.project_phases.first)
    end

    it { should have_content('Name') }
    it { should have_content('Description') }
    it { should have_content('Deliverable type') }
    it { should have_content('Complexity') }
    it { should have_button('Create') }
    it { should have_link('Cancel') }

  end

  describe "submitting a valid form" do
    before do
      visit new_project_project_phase_deliverable_path(project, project.project_phases.first)
      fill_in 'Name', :with => "Super duper deliverable"
      fill_in 'Description', :with => "A description"
      select(deliverable_type.name, :from => 'deliverable_deliverable_type_id')
      select(complexity.name, :from => 'Complexity')
    end

    it "create should create a project" do
      expect { click_on 'Create' }.to change(Deliverable, :count).by(1)
    end

    #it "cancel should not create a project" do
    #  expect { click_on 'Cancel' }.to change(Deliverable, :count).by(0)
    #end
  end
end