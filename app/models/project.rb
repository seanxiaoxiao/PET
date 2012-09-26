class Project < ActiveRecord::Base
  attr_accessible :name, :description
  has_one :lifecycle
end
