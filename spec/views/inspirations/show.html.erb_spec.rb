require 'spec_helper'

describe "inspirations/show.html.erb" do
  before(:each) do
    @inspiration = assign(:inspiration, stub_model(Inspiration,
      :body => "Body",
      :author => "Author"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Body/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Author/)
  end
end
