require 'spec_helper'

describe DeliverablesController do

  let!(:lifecycle) { FactoryGirl.create(:lifecycle) }
  let!(:lifecycle_phase) { FactoryGirl.create(:lifecycle_phase, :lifecycle => lifecycle) }
  let!(:project) { FactoryGirl.create(:project, :lifecycle => lifecycle) }
  let!(:another_project) { FactoryGirl.create(:project, :lifecycle => lifecycle) }
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

  describe "GET new" do
    it "assigns a new deliverable as Deliverable" do
      get :new, {:project_id => project.to_param, :project_phase_id => project.project_phases.first.to_param}
      assigns(:deliverable).should be_a_new(Deliverable)
    end

    it "give a BAD REQUEST if the project phase does not belong to the project" do
      get :new, {:project_id => another_project.to_param, :project_phase_id => project.project_phases.first.to_param}
      response.should be_bad_request
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Deliverable" do
        expect {
          post :create, {:project_id => project.to_param,
                         :project_phase_id => project.project_phases.first.to_param,
                         :deliverable => {
                             :name => "Test Title",
                             :description => "Test content",
                             :complexity_id => complexity.id,
                             :deliverable_type_id => deliverable_type.id
                         }}
        }.to change(Deliverable, :count).by(1)
      end

    end

    describe "with invalid params" do
      it "does not create a new Deliverable" do
        expect {
          post :create, {:project_id => project.to_param,
                         :project_phase_id => project.project_phases.first.to_param,
                         :deliverable => {
                             :description => "Test content",
                             :complexity_id => complexity.id,
                             :deliverable_type_id => deliverable_type.id
                         }}
        }.to change(Deliverable, :count).by(0)
      end

      it "does not create a new Deliverable with the project which the phase does not belong to" do
        expect {
          post :create, {:project_id => another_project.to_param,
                         :project_phase_id => project.project_phases.first.to_param,
                         :deliverable => {
                             :name => "Test Title",
                             :description => "Test content",
                             :complexity_id => complexity.id,
                             :deliverable_type_id => deliverable_type.id
                         }}
        }.to change(Deliverable, :count).by(0)
      end

    end
  end
end