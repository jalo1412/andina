require 'test_helper'

class UserStoriesTest < ActionDispatch::IntegrationTest
  fixtures :products
  include ActiveJob::TestHelper

  # A user goes to the home page. They select a product, adding it to their
  # cart, and check out, filling in their details on the checkout form. When
  # they submit, an order is created containing their information, along with a
  # single line item corresponding to the product they added to their cart.

  test 'buying a product' do
    start_order_count = Order.count
    scarf = products(:scarf)

    get '/'
    assert_response :success
    assert_select 'h1', 'Andina'

    get '/store/index'
    assert_response :success
    assert_select 'h1', "Andina's Catalogs"
    # add item
    post '/line_items', params: { product_id: scarf.id }, xhr: true
    assert_response :success
    cart = Cart.find(session[:cart_id])
    assert_equal 1, cart.line_items.size
    assert_equal scarf, cart.line_items[0].product
    # add new order
    get '/orders/new'
    assert_response :success
    assert_select 'h2', 'Checkout form'
    perform_enqueued_jobs do
      post '/orders',
           params: { order: { name: 'Javier', adress: 'Street 14', email: 'jalo1412@gmail.com', pay_type: 'Check' } }
      assert_response :redirect
      follow_redirect!
      assert_response :success
      assert_select 'h1', "Andina's Catalogs"

      # test DB
      assert_equal start_order_count + 1, Order.count
      order = Order.last
      assert_equal 'Javier', order.name
      assert_equal 'Street 14', order.adress
      assert_equal 'jalo1412@gmail.com', order.email
      assert_equal 'Check', order.pay_type

      assert_equal 1, order.line_items.size
      line_item = order.line_items[0]
      assert_equal scarf, line_item.product

      # To-Do:  test Mailer

    end
  end
end
