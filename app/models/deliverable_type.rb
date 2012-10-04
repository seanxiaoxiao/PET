# == Schema Information
#
# Table name: deliverable_types
#
#  id                 :integer          not null, primary key
#  name               :string(255)
#  unit_of_measure_id :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class DeliverableType < ActiveRecord::Base
  attr_accessible :name, :unit_of_measure_id

  belongs_to :unit_of_measure

  validates :name, :presence => true, :length => { :maximum => 20}
  validates :unit_of_measure, :presence => true

end
