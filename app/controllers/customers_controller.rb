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
    @comments = @customer.comments.order(id: "DESC")
    @comment = Comment.new
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    customer = Customer.find(params[:id])
    if customer.update(customer_params)
      redirect_to root_path
    else
      render :edit
    end

  end


  def search
    @results = @c.result
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
