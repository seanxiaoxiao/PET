require 'spec_helper'

describe Project do


  describe "Project should have no lifecycle" do
    proj = Project.new()
    proj.lifecycle.nil?
  end


  before do
    @project = Project.new()
  end

  subject { @project }

  it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should respond_to(:lifecycle)}

end
