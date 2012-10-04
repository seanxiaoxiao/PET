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

require 'spec_helper'

describe Project do

  let!(:lifecycle) { FactoryGirl.create(:lifecycle) }
  let!(:lifecycle_phase) { FactoryGirl.create(:lifecycle_phase, :lifecycle => lifecycle) }
  let!(:project) { FactoryGirl.create(:project, :lifecycle => lifecycle) }

  subject { project }

  it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should respond_to(:lifecycle) }
  it { should respond_to(:project_phases) }
  it { should be_valid }

  describe "constraints on name" do
    it { should validate_uniqueness_of(:name) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:lifecycle) }
    it { project.name.should have_at_most(100).characters }
  end

  describe "creates a new Project and match the Project Phase to Lifecycle Phase" do
    it { should have(1).project_phases }
    it { project.project_phases[0].lifecycle_phase_id.should == lifecycle_phase.id }
  end

end