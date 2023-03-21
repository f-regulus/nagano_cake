class Public::OrdersController < ApplicationController
  #注文情報入力画面
  def new
    @order = Order.new
    @customer = current_customer
    @deliveries = current_customer.delivery.all
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    if@order.save!
      #カート情報
      current_customer.cart_items.each do |cart_item| #カートの商品を1つずつ取り出しループ
        @ordered_item = OrderedItem.new #初期化宣言
        @ordered_item.item_id = cart_item.item_id #商品idを注文商品idに代入
        @ordered_item.quantity = cart_item.quantity #商品の個数を注文商品の個数に代入
        @ordered_item.tax_included_price = (cart_item.item.price*1.08).floor #消費税込みに計算して代入
        @ordered_item.order_id =  @order.id #注文商品に注文idを紐付け
        @ordered_item.save #注文商品を保存
      end #ループ終わり

      #カートの中身を削除
      current_customer.cart_items.destroy_all
      redirect_to orders_success_path
    end
  end

  def index
  end

  def show
  end

  #注文情報確認画面
  def confirm
    @order = Order.new(order_params)

      # ご自身の住所 [:address_option]=="0"としてデータをhtmlから受ける
    if params[:order][:address_option] == "0"
      @order.postal_code = current_customer.post_code
      @order.address = current_customer.address
      @order.name = current_customer.full_name

      # 登録住所 [:address_option]=="1"としてデータをhtmlから受ける
    elsif params[:order][:address_option] == "1"
      ship = Delivery.find(params[:order][:deliveries_id])
      #orderのmember_id(=カラム)でアドレス(帳)を選び、そのデータ送る
      @order.postal_code = ship.post_code
      @order.address = ship.address
      @order.name = ship.name

      # 新規住所入力 [:address_option]=="2"としてデータをhtmlから受ける
    elsif params[:order][:address_option] = "2"
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
    else
      #render 'new'
    end
    #orderテーブルの顧客idとログインしている顧客idを紐付ける
    @order.customer_id = current_customer.id
  end

  # 注文完了画面
  def success
  end

  private

  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :payment)
  end
end