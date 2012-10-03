# == Schema Information
#
# Table name: deliverables
#
#  id                  :integer          not null, primary key
#  name                :string(255)
#  description         :text
#  deliverable_type_id :integer
#  complexity_id       :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class Deliverable < ActiveRecord::Base
  attr_accessible :complexity_id, :deliverable_type_id, :description, :name

  validates :name, :presence => true, :length => { :maximum => 100}, :uniqueness => true
  validates :complexity, :presence => true
  validates :deliverable_type, :presence => true

  belongs_to :complexity
  belongs_to :deliverable_type
end
