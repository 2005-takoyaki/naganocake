class ShipsController < ApplicationController
  # before_action :authenticate_user!

  def index
    @ship_new = Ship.new
    @ships = Ship.where(customer_id: 1)
    # @ships = Ship.where(customer_id: current_customer.id)
  end

  def edit
    @ship = Ship.find(params[:id])
  end

  def update
    @ship = Ship.find(params[:id])
    if @ship.update(ship_params)
      redirect_to ships_path
    else
      render "edit"
    end
  end

  def create
    # @customer = current_customer
    @customer = Customer.find(1)
    @ship_new = Ship.new(ship_params)
    @ship_new.customer_id = @customer.id
    if @ship_new.save
      redirect_to ships_path
    else
      @ships = Ship.where(customer_id: 1)
      # @ships = Ship.where(customer_id: current_customer.id)
      render 'index'
    end
  end

  def destroy
  end


  private
  def ship_params
    params.require(:ship).permit(:name, :postal_code, :address)
  end
end
