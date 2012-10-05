class DeliverablesController < ApplicationController
  respond_to :html

  def new
    @project_phase = ProjectPhase.find(params[:project_phase_id])
    @deliverable = Deliverable.new
    respond_with @deliverable
  end

  def create
    @deliverable = Deliverable.new(params[:deliverable])
    @project = Project.find(params[:project_id])
    @project_phase = ProjectPhase.find(params[:project_phase_id])
    @deliverable.project_phase= @project_phase
    @deliverable.save
    respond_with(@project, @project_phase, @deliverable)

  end

  def show

  end
end