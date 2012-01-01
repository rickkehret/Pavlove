require 'spec_helper'

describe "inspirations/index.html.erb" do
  before(:each) do
    assign(:inspirations, [
      stub_model(Inspiration,
        :body => "Body",
        :author => "Author"
      ),
      stub_model(Inspiration,
        :body => "Body",
        :author => "Author"
      )
    ])
  end

  it "renders a list of inspirations" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Body".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Author".to_s, :count => 2
  end
end
