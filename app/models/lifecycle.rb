# == Schema Information
#
# Table name: lifecycles
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Lifecycle < ActiveRecord::Base
  attr_accessible :name, :description

  validates :name,  :uniqueness => true, :presence => true, :length => { :minimum => 2, :maximum => 100}

  def self.select_options
    self.all.collect {|lifecycle| [lifecycle.name, lifecycle.id]}
  end
end
