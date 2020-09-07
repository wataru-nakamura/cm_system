class CustomersController < ApplicationController
  before_action :search_customer, only: [:index, :search]
  
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

  def show
    @customer = Customer.find(params[:id])
    # binding.pry
  end

  def edit
    @customer = Customer.find(params[:id])
    # binding.pry
  end


  def search
    @results = @c.result
    # binding.pry
  end


  private

  def customer_params
   params.require(:customer).permit(:family_name, :first_name, :family_name_kana,
   :first_name_kana, :birthday, :gender, :age, :postal_code, :address, :building_name,
   :phone_number, :email)
  end

  def search_customer
    @c = Customer.ransack(params[:q])  # 検索オブジェクトを生成
  end

end
