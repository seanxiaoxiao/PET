require 'spec_helper'

describe "Post pages" do

  subject { page }

  describe "making a new project" do

    let!(:lifecycle) { FactoryGirl.create(:lifecycle) }

    before do
      visit new_project_path
    end

    it { should have_content('Name') }
    it { should have_content('Lifecycle') }
    it { should have_content('Description') }

    it { should have_button('Save') }
    it { should have_link('Back', href: projects_path) }

    describe "submitting an empty form" do
      describe "errors" do
        before { click_on 'Save' }
        it { should have_content('error') }
      end
      it "should not create a project with blank data" do
        expect { click_button 'Save' }.not_to change(Project, :count)
      end
    end

    describe "submitting a valid form" do
      before do
        fill_in 'Name', with: "Super duper project"
        fill_in 'Description', with: "A description"
        save_page
        select(lifecycle.name, :from => 'Lifecycle')
      end
      it "should create the project" do
        expect {click_on 'Save' }.to change(Project, :count)
      end
    end

  end
end