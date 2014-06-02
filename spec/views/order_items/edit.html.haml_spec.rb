require 'spec_helper'

describe "order_items/edit" do
  before(:each) do
    @order_item = assign(:order_item, stub_model(OrderItem,
      :order_id => "",
      :product_id => "",
      :quantity => "",
      :price => "9.99"
    ))
  end

  it "renders the edit order_item form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", order_item_path(@order_item), "post" do
      assert_select "input#order_item_order_id[name=?]", "order_item[order_id]"
      assert_select "input#order_item_product_id[name=?]", "order_item[product_id]"
      assert_select "input#order_item_quantity[name=?]", "order_item[quantity]"
      assert_select "input#order_item_price[name=?]", "order_item[price]"
    end
  end
end
