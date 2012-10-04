# == Schema Information
#
# Table name: unit_of_measures
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class UnitOfMeasure < ActiveRecord::Base
  attr_accessible :name

  validates :name, :presence => true, :length => { :maximum => 100}, :uniqueness => true
end
