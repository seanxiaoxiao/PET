# == Schema Information
#
# Table name: deliverable_types
#
#  id                 :integer          not null, primary key
#  name               :string(255)
#  unit_of_measure_id :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

require 'spec_helper'

describe DeliverableType do
  let(:deliverable_type) { FactoryGirl.create(:deliverable_type) }

  subject { deliverable_type }

  it { should respond_to(:name) }
  it { should be_valid }

  describe "constraints on name" do
    it { should validate_presence_of(:name) }
    it { deliverable_type.name.should have_at_most(100).characters }
  end


  describe "constraints on unit_of_measure" do
    it { should validate_presence_of(:unit_of_measure) }
  end

end
