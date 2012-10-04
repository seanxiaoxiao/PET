class ProjectPhasesController < ApplicationController

  respond_to :html

  @active_tab = :phases

  def index
    @project = Project.find(params[:project_id])
    respond_with @project
  end

  def show
    @project_phase = ProjectPhase.find(params[:id])
    if @project_phase.project.id == params[:project_id].to_i
      @project = @project_phase.project
      respond_with @project_phase
    else
      render :nothing => true, :status => :bad_request
    end
  end

end

