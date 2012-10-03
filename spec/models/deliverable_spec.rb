# == Schema Information
#
# Table name: deliverables
#
#  id                  :integer          not null, primary key
#  name                :string(255)
#  description         :text
#  deliverable_type_id :integer
#  complexity_id       :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

require 'spec_helper'

describe Deliverable do
  let(:deliverable) { FactoryGirl.create(:deliverable) }

  subject { deliverable }

  it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should be_valid }

  describe "constraints on name" do
    it { should validate_uniqueness_of(:name) }
    it { should validate_presence_of(:name) }
    it { deliverable.name.should have_at_most(100).characters }
  end

  describe "constraints on complexity" do
    it { should validate_presence_of(:complexity) }
  end

  describe "constraints on deliverable type" do
    it { should validate_presence_of(:deliverable_type) }
  end

end
