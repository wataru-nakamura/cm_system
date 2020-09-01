class CustomersController < ApplicationController
  def index
    @customer = Customer.all
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      redirect_to root_path
    else
      render :new
    end
  end

  def search
  end


  private

  def customer_params
   params.require(:customer).permit(:family_name, :first_name, :family_name_kana,
   :first_name_kana, :birthday, :age, :postal_code, :address, :building_name,
   :phone_number, :email)
  end

end
