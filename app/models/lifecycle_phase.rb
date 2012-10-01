class LifecyclePhase < ActiveRecord::Base
  attr_accessible :description, :lifecycle_id, :name, :sequence

  belongs_to :lifecycle

  validates :lifecycle, :presence => true
  validates :name, :presence => true, :length => { :maximum => 100}
  validates :sequence, :presence => true
end
