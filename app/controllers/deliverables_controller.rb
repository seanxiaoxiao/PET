class DeliverablesController < ApplicationController
  respond_to :html

  before_filter :validate_params

  def validate_params
    @project = Project.find(params[:project_id])
    @project_phase = ProjectPhase.find(params[:project_phase_id])
    if @project.id != @project_phase.project.id
      render :nothing => true, :status => :bad_request
    end
  end

  def new
    @deliverable = Deliverable.new
    respond_with(@project, @project_phase, @deliverable)
  end

  def create
    @deliverable = Deliverable.new(params[:deliverable])
    @deliverable.project_phase= @project_phase
    @deliverable.save
    respond_with(@project, @project_phase, @deliverable)
  end

  def show

  end

end