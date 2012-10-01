class ProjectPhase < ActiveRecord::Base
  attr_accessible :lifecycle_phase_id, :project_id
  belongs_to :lifecycle_phase
  belongs_to :project

  validates :lifecycle_phase, :presence => true
  validates :project, :presence => true
end
