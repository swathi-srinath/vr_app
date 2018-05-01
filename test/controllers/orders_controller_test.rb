require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order = orders(:one)
  end

  test "should update order" do
    patch order_url(@order), params: { order: { address: @order.address, customer_name: @order.customer_name, email: @order.email, order_status: @order.order_status, phone: @order.phone, shipping_cost: @order.shipping_cost, string: @order.string, sub_total: @order.sub_total, total_cost: @order.total_cost } }
    assert_redirected_to order_url(@order)
  end

  test "should destroy order" do
    assert_difference('Order.count', -1) do
      delete order_url(@order)
    end

    assert_redirected_to orders_url
  end
end
