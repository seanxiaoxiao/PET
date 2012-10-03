# == Schema Information
#
# Table name: lifecycle_phases
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  description  :text
#  sequence     :integer
#  lifecycle_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'spec_helper'

describe LifecyclePhase do

  let(:lifecycle) { FactoryGirl.create(:lifecycle) }
  let(:lifecycle_phase) { FactoryGirl.create(:lifecycle_phase, :lifecycle => lifecycle) }


  subject { lifecycle_phase }

  it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should respond_to(:sequence) }
  it { should respond_to(:lifecycle) }
  it { should be_valid }

  describe "constraints on name" do
    it { should validate_presence_of(:name) }
    it { lifecycle_phase.name.should have_at_most(100).characters }
  end

  describe "constraints on sequence" do
    #it { should validate_uniqueness_of(:sequence) }
    it { should validate_presence_of(:sequence) }
  end

  describe "presence of lifecycle" do
    it {should validate_presence_of(:lifecycle)}
  end

end
