# == Schema Information
#
# Table name: complexities
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Complexity < ActiveRecord::Base
  attr_accessible :name

  validates :name, :presence => true, :length => { :maximum => 100}, :uniqueness => true

  def self.select_options
    self.all.collect {|complexity| [complexity.name, complexity.id]}
  end
end
