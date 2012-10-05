require "spec_helper"

describe ProjectPhasesController do
  describe "routing" do

    it "routes to #index" do
      get("/projects/1/project_phases").should route_to("project_phases#index", :project_id => "1")
    end

    it "routes to #show" do
      get("/projects/1/project_phases/2").should route_to("project_phases#show", :project_id => "1", :id => "2")
    end

  end
end
