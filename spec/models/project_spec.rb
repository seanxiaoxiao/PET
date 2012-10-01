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

  let(:lifecycle) { FactoryGirl.create(:lifecycle) }
  let(:project) { FactoryGirl.create(:project, :lifecycle => lifecycle) }

  subject { project }

  it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should respond_to(:lifecycle) }
  it { should be_valid }

  describe "constraints on name" do
    it { should validate_uniqueness_of(:name) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:lifecycle) }
    it { project.name.should have_at_most(100).characters }
  end
end
