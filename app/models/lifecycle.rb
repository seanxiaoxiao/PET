class Lifecycle < ActiveRecord::Base
  attr_accessible :name, :description

  def self.select_options
    self.all.collect {|l| [l.name, l.id]}
  end
end
