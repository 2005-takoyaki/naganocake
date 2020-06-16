class ShipsController < ApplicationController
  def index
    @ship_new = Ship.new
    @ships = Ship.where(user_id: current_customer.id)
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
