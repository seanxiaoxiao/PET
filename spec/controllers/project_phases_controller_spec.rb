require 'spec_helper'

describe ProjectPhasesController do

  let!(:lifecycle) { FactoryGirl.create(:lifecycle) }
  let!(:lifecycle_phase) { FactoryGirl.create(:lifecycle_phase, :lifecycle => lifecycle) }
  let!(:project) { FactoryGirl.create(:project, :lifecycle => lifecycle) }
  let!(:another_project) { FactoryGirl.create(:project, :lifecycle => lifecycle) }

  before {
    @project_phase = project.project_phases.first
  }

  describe "GET index shows the list of project phases" do
    it "assigns all project phases as a variable called project_phases" do
      get :index, {:project_id => project.to_param}
      assigns(:project).project_phases.should eq(project.project_phases.sort_by { |p| p.sequence })
    end

    it "assigns all project phases in sequence" do
      get :index, {:project_id => project.to_param}
      assigns(:project).project_phases.should eq(project.project_phases)
    end

  end

  describe "GET show a project phase" do
    it "assigns the requested project phase" do
      get :show, {:project_id => project.to_param, :id => @project_phase.to_param}
      assigns(:project_phase).should eq(@project_phase)
    end

    it "returns bad request if the project phase does not belong the given project" do
      get :show, {:project_id => 10000, :id => @project_phase.to_param}
      response.should be_bad_request
    end

    it "returns bad request if the project phase does not belong the given project" do
      get :show, {:project_id => another_project.to_param, :id => @project_phase.to_param}
      response.should be_bad_request
    end

  end


end