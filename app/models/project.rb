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
  has_one :lifecycle

  validates :name,  :uniqueness => true, :presence => true, :length => { :minimum => 3, :maximum => 100}
  validates :lifecycle, :presence => true
end
