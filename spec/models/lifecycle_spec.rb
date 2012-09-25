require 'spec_helper'

describe Lifecycle do

  before do
    @lifecycle = Lifecycle.new()
  end

  subject { @lifecycle }

  it { should respond_to(:name) }
  it { should respond_to(:description) }

  it { should be_valid }

  it "Creating a Lifecycle, the new lifecycle should not be nil" do
    should_not be_nil
  end


end

