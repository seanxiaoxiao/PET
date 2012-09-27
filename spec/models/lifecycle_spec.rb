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

require 'spec_helper'

describe Lifecycle do

  let(:lifecycle) { FactoryGirl.create(:lifecycle) }

  subject { lifecycle }

  it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should be_valid }

  describe "constraints on name" do
    it { should validate_uniqueness_of(:name) }
    it { should validate_presence_of(:name) }
    it { lifecycle.name.should have_at_least(3).characters }
    it { lifecycle.name.should have_at_most(100).characters }
  end
end

