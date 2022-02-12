class UserController < ApplicationController
    
  def show
    @user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to public_user_path(@user.id)
    else
      render 'edit'
    end
  end
  
  def withdraw
    @user = User.find(params[:user_id])
    if @user.update(is_active: false)
      reset_session
    end
    flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。" 
    redirect_to root_path
  end
  
    # 退会の仕方について
  def unsubscribe
    @user = current_user.id
  end
  
  private
  def user_params
    params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code,
                                     :address, :telephone_number, :is_active)
  end
end
