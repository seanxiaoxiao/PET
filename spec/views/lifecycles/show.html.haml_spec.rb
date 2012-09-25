require 'spec_helper'

describe "lifecycles/show" do
  before(:each) do
    @lifecycle = assign(:lifecycle, stub_model(Lifecycle,
      :name => "Name",
      :description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Description/)
  end
end
