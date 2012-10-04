# == Schema Information
#
# Table name: projects
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  lifecycle_id :integer
#  description  :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Project < ActiveRecord::Base
  attr_accessible :name, :description, :lifecycle_id

  belongs_to :lifecycle
  has_many :project_phases

  validates :name,  :uniqueness => true, :presence => true, :length => { :maximum => 100}
  validates :lifecycle, :presence => true

  after_create do
    self.lifecycle.lifecycle_phases.each do |lifecycle_phase|
      project_phases.create(:lifecycle_phase_id => lifecycle_phase.id)
    end
  end

end
