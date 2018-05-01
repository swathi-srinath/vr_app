require 'test_helper'

class OrderItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order_item = order_items(:one)
  end


  test "should create order_item" do
    assert_difference('OrderItem.count') do
      post order_items_url, params: { order_item: { order_id: @order_item.order_id, product_id: @order_item.product_id, quantity: @order_item.quantity, total_price: @order_item.total_price, unit_price: @order_item.unit_price } }
    end

    assert_redirected_to order_item_url(OrderItem.last)
  end


  test "should update order_item" do
    patch order_item_url(@order_item), params: { order_item: { order_id: @order_item.order_id, product_id: @order_item.product_id, quantity: @order_item.quantity, total_price: @order_item.total_price, unit_price: @order_item.unit_price } }
    assert_redirected_to order_item_url(@order_item)
  end

  test "should destroy order_item" do
    assert_difference('OrderItem.count', -1) do
      delete order_item_url(@order_item)
    end

    assert_redirected_to order_items_url
  end
end
