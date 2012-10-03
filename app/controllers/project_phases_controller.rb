class ProjectPhasesController < ApplicationController

  respond_to :html

  @active_tab = :phases

  def index
    @project = Project.find(params[:project_id])
    respond_with @project
  end


end

