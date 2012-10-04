# == Schema Information
#
# Table name: lifecycle_phases
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  description  :text
#  sequence     :integer
#  lifecycle_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class LifecyclePhase < ActiveRecord::Base
  attr_accessible :description, :lifecycle_id, :name, :sequence

  belongs_to :lifecycle

  validates :name, :presence => true, :length => { :maximum => 100}
  validates :lifecycle, :presence => true
  validates :sequence, :presence => true
end
