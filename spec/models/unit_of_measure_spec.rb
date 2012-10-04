# == Schema Information
#
# Table name: unit_of_measures
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe UnitOfMeasure do

  let(:unit_of_measure) { FactoryGirl.create(:unit_of_measure) }

  subject { unit_of_measure }

  it { should respond_to(:name) }
  it { should be_valid }

  describe "constraints on name" do
    it { should validate_uniqueness_of(:name) }
    it { should validate_presence_of(:name) }
    it { unit_of_measure.name.should have_at_most(20).characters }
  end
end
