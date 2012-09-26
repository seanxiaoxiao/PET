class Project < ActiveRecord::Base
  attr_accessible :description, :lifecycle_id, :name
  has_one :lifecycle
end
