require 'spec_helper'

describe "inspirations/new.html.erb" do
  before(:each) do
    assign(:inspiration, stub_model(Inspiration,
      :body => "MyString",
      :author => "MyString"
    ).as_new_record)
  end

  it "renders new inspiration form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => inspirations_path, :method => "post" do
      assert_select "input#inspiration_body", :name => "inspiration[body]"
      assert_select "input#inspiration_author", :name => "inspiration[author]"
    end
  end
end
