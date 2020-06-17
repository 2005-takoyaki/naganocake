class ShipsController < ApplicationController
  before_action :authenticate_user!

  def index
    @ship_new = Ship.new
    # @ships = Ship.where(customer_id: 1)
    @ships = Ship.where(customer_id: current_customer.id)
  end

  def edit
  end

  def update
  end

  def create
  end

  def destroy
  end
end
