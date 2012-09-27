require 'spec_helper'

describe Project do

  before do
    @project = Project.new
    @project.name = "PET"
  end

  subject { @project }

  it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should respond_to(:lifecycle) }
  it { should be_valid }

  describe "constraints on name" do
    it { should validate_uniqueness_of(:name) }
    it { should validate_presence_of(:name) }
    it { @project.name.should have_at_least(3).characters }

    describe "invalid characters" do
      before { @project.name = "  " }
      it { should_not be_valid }
    end

  end
end
