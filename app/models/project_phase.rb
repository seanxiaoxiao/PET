# == Schema Information
#
# Table name: project_phases
#
#  id                 :integer          not null, primary key
#  lifecycle_phase_id :integer
#  project_id         :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class ProjectPhase < ActiveRecord::Base
  attr_accessible :lifecycle_phase_id, :project_id
  belongs_to :lifecycle_phase
  belongs_to :project

  validates :lifecycle_phase, :presence => true
  validates :project, :presence => true
end
