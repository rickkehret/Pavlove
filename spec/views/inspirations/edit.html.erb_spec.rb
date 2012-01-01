require 'spec_helper'

describe "inspirations/edit.html.erb" do
  before(:each) do
    @inspiration = assign(:inspiration, stub_model(Inspiration,
      :body => "MyString",
      :author => "MyString"
    ))
  end

  it "renders the edit inspiration form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => inspirations_path(@inspiration), :method => "post" do
      assert_select "input#inspiration_body", :name => "inspiration[body]"
      assert_select "input#inspiration_author", :name => "inspiration[author]"
    end
  end
end
