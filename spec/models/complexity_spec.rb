# == Schema Information
#
# Table name: complexities
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Complexity do
  let(:complexity) { FactoryGirl.create(:complexity) }

  subject { complexity }

  it { should respond_to(:name) }
  it { should be_valid }

  describe "constraints on name" do
    it { should validate_uniqueness_of(:name) }
    it { should validate_presence_of(:name) }
    it { complexity.name.should have_at_most(100).characters }
  end

end
