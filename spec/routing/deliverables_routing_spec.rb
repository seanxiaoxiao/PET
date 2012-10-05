require "spec_helper"

describe DeliverablesController do
  describe "routing" do

    it "routes to #new" do
      get("/projects/1/project_phases/2/deliverables/new").should route_to("deliverables#new", :project_id => "1", :project_phase_id => "2")
    end

    it "routes to #create" do
      post("/projects/1/project_phases/2/deliverables").should route_to("deliverables#create", :project_id => "1", :project_phase_id => "2")
    end

  end
end
