require 'spec_helper'

describe "Project pages" do

  subject { page }
  let!(:lifecycle) { FactoryGirl.create(:lifecycle) }
  let!(:project) { FactoryGirl.create(:project, :lifecycle => lifecycle) }

  describe "making a new project" do

    before do
      visit new_project_path
    end

    it { should have_content('Name') }
    it { should have_content('Lifecycle') }
    it { should have_content('Description') }

    it { should have_button('Save') }
    it { should have_link('Back', :href => projects_path) }

    describe "submitting an empty form" do
      describe "errors" do
        before { click_on 'Save' }
        it { should have_content('error') }
      end
      it "should not create a project with blank data" do
        expect { click_button 'Save' }.not_to change(Project, :count).by(1)
      end
    end

    describe "submitting a valid form" do
      before do
        fill_in 'Name', :with => "Super duper project"
        fill_in 'Description', :with => "A description"
        save_page
        select(lifecycle.name, :from => 'Lifecycle')
      end
      it "should create the project" do
        expect {click_on 'Save' }.to change(Project, :count).by(1)
      end
    end

  end

  describe "viewing all projects" do

    before do
      visit projects_path
    end

    it { should have_content('All Projects') }
    it { should have_content(project.name) }
    it { should have_link('Create Project', :href => new_project_path) }

  end

  describe "viewing a project" do

    before do
      visit project_path(project)
    end

    it { should have_content(project.name) }
    it { should have_content('Lifecycle') }

    it { should have_content(project.lifecycle.name) }
    it { should have_content('Description') }
    it { should have_content(project.description) }

    #it { should have_link('Edit', :href => edit_project_path(project)) }
    it { should have_link('Back', :href => projects_path) }

  end

end