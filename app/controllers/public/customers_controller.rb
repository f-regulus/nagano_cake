class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
       flash[:notice] = "アップデートいたしました"
      redirect_to customers_mypage_path
    else
      render customers_mypage_edit_path
    end
  end

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :kana_first_name,
    :kana_last_name, :postal_code, :address, :telephone_number, :email )
  end

  def unsubscribe
  end

  def withdrawal
    @customer = current_customer
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end
end
