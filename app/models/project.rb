class Project < ActiveRecord::Base
  attr_accessible :name, :description, :lifecycle_id
  has_one :lifecycle
end
