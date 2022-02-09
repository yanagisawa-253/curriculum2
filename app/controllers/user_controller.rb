class UserController < ApplicationController
    
  def show
    @customer =Customer.find(params[:id])
  end
  
  def edit
    @customer =Customer.find(params[:id])
  end
  
  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to public_customer_path(@customer.id)
    else
      render 'edit'
    end
  end
  
  def withdraw
    @customer = Customer.find(params[:customer_id])
    if @customer.update(is_active: false)
      reset_session
    end
    flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。" 
    redirect_to root_path
  end
  
    # 退会の仕方について
  def unsubscribe
    @customer = current_customer.id
  end
  
  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code,
                                     :address, :telephone_number, :is_active)
  end
end
