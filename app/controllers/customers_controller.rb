class CustomersController < ApplicationController
  def index
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    binding.pry
    if @customer.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def destory
  end

  private

  def customer_params
   params.require(:customer).permit(:family_name, :first_name, :family_name_kana,
   :first_name_kana, :birthday, :age, :postal_code, :address, :building_name,
   :phone_number, :email)
  end

end
