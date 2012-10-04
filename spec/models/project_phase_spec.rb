# == Schema Information
#
# Table name: project_phases
#
#  id                 :integer          not null, primary key
#  lifecycle_phase_id :integer
#  project_id         :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

require 'spec_helper'


describe ProjectPhase do

  let(:project_phase) { FactoryGirl.create(:project_phase) }

  subject { project_phase }

  it { should respond_to(:project) }
  it { should respond_to(:lifecycle_phase) }
  it { should respond_to(:deliverables) }

  #Virtual Properties
  it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should respond_to(:sequence) }

  it { should be_valid }

  describe "project should be present" do
    it { should validate_presence_of(:project) }
  end

  describe "lifecycle phase should be present" do
    it { should validate_presence_of(:lifecycle_phase) }
  end

end
