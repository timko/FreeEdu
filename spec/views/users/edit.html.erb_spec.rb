require 'spec_helper'

describe "users/edit" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :name => "MyString",
      :password => "MyString",
      :disk_space => 1,
      :bandwidth => 1
    ))
  end

  it "renders the edit user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => users_path(@user), :method => "post" do
      assert_select "input#user_disk_space", :name => "user[disk_space]"
      assert_select "input#user_bandwidth", :name => "user[bandwidth]"
    end
  end
end