# == Schema Information
#
# Table name: deliverables
#
#  id                  :integer          not null, primary key
#  name                :string(255)
#  description         :text
#  deliverable_type_id :integer
#  complexity_id       :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  project_phase_id    :integer
#

class Deliverable < ActiveRecord::Base
  attr_accessible :name, :description, :complexity_id, :deliverable_type_id

  belongs_to :project_phase
  belongs_to :complexity
  belongs_to :deliverable_type

  validates :name, :presence => true, :length => {:maximum => 100}
  validates :project_phase, :presence => true
  validates :complexity, :presence => true
  validates :deliverable_type, :presence => true

end
