require 'spec_helper'


describe ProjectPhase do

  let(:lifecycle) { FactoryGirl.create(:lifecycle) }
  let(:project) { FactoryGirl.create(:project, :lifecycle => lifecycle) }
  let(:lifecycle_phase) { FactoryGirl.create(:lifecycle_phase, :lifecycle => lifecycle) }
  let(:project_phase) { FactoryGirl.create(:project_phase, :lifecycle_phase => lifecycle_phase, :project => project) }

  subject { project_phase }

  it { should respond_to(:project) }
  it { should respond_to(:lifecycle_phase) }

  describe "project should be present" do
    it { should validate_presence_of(:project) }
  end

  describe "lifecycle phase should be present" do
    it { should validate_presence_of(:lifecycle_phase) }
  end

end
