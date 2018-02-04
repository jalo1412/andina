class StoreController < ApplicationController
  include CurrentCart, CurrentUser
  before_action :set_user
  before_action :set_cart
  def index
    @products = Product.order(:title)
  end
end
