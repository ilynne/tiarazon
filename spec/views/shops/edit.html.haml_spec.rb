require 'spec_helper'

describe "shops/edit" do
  before(:each) do
    @shop = assign(:shop, stub_model(Shop,
      :name => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit shop form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", shop_path(@shop), "post" do
      assert_select "input#shop_name[name=?]", "shop[name]"
      assert_select "textarea#shop_description[name=?]", "shop[description]"
    end
  end
end
