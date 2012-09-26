require 'spec_helper'

describe ProjectsController do

  before do
    @lifecycle = FactoryGirl.create(:lifecycle)
    @project = FactoryGirl.create(:project, :lifecycle => @lifecycle)
    @valid_project_attributes = {
        :name => "Test Title",
        :description => "Test content",
        :lifecycle_id => @lifecycle,
    }
  end

  def stub_all_posts_to_prevent_creation
    Project.any_instance.stub(:save).and_return(false)
    Project.any_instance.stub(:errors).and_return('anything')
  end

  describe "GET index" do
    it "assigns all projects as @projects" do
      get :index
      assigns(:projects).should eq([@project])
    end
  end

  describe "GET show" do
    it "assigns the requested project as @project" do
      get :show, {:id => @project.to_param}
      assigns(:project).should eq(@project)
    end
  end

  describe "GET new" do
    it "assigns a new project as @project" do
      get :new
      assigns(:project).should be_a_new(Project)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Project" do
        expect {
          post :create, @valid_project_attributes
        }.to change(Project, :count).by(1)
      end

      it "assigns a newly created project as @project" do
        post :create, @valid_project_attributes
        assigns(:project).should be_a(Project)
        assigns(:project).should be_persisted
      end

      it "redirects to the created project" do
        post :create, @valid_project_attributes
        response.should redirect_to(Project.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved project as @project" do
        stub_all_posts_to_prevent_creation
        post :create, :project => {}
        assigns(:project).should be_a_new(Project)
      end

      it "re-renders the 'new' template" do
        stub_all_posts_to_prevent_creation
        post :create, :project => {}
        response.should render_template("new")
      end
    end
  end

end
