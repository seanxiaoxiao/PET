require 'spec_helper'

describe "lifecycles/index" do
  before(:each) do
    assign(:lifecycles, [
      stub_model(Lifecycle,
        :name => "Name",
        :description => "Description"
      ),
      stub_model(Lifecycle,
        :name => "Name",
        :description => "Description"
      )
    ])
  end

  it "renders a list of lifecycles" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
