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
  has_many :deliverables

  validates :lifecycle_phase, :presence => true
  validates :project, :presence => true

  attr_accessor :name, :description, :sequence

  def name
    lifecycle_phase ? lifecycle_phase.name : nil
  end

  def description
    lifecycle_phase ? lifecycle_phase.description : nil
  end

  def sequence
    lifecycle_phase ? lifecycle_phase.sequence : nil
  end

end
