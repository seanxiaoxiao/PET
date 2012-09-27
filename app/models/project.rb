class Project < ActiveRecord::Base
  attr_accessible :name, :description, :lifecycle_id
  validates :name,  :uniqueness => true, :presence => true, :length => { :minimum => 3, :maximum => 100}

  has_one :lifecycle
end
