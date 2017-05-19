class BidsController < ApplicationController
  before_action :authenticate_user!
  def index
  @bids = Bid.where(item_id: params[:item_id]).order("created_at DESC")
  end
  def show
    @bid = Bid.find(params[:id])
  end

  def new
    @item = Item.find(params[:item_id])
    # @bid = @item.bids.build
    @bid = Bid.new
  end

  def create
    @item = Item.find(params[:item_id])
    @bid =Bid.new(bid_params)
    respond_to do |format|
      if @bid.save
        format.html { redirect_to @item, notice: 'Your item has been updated.'}
      else
        @item = Item.find(bid_params[:item_id])
        format.html { render action: 'new' }
      end
    end
  end

def update
  @bid = Bids.find(params[:id])
  @item = Item.find(@bid.item_id)

  @old_user = User.find(@bid.user_id)
  @old_user.budget += @item.initial_price + @bid.amount

  @new_user = User.find(params[:bid][:user_id])
  @bid.user_id = @new_user.id
  @bid.amount = params[:bid][:amount]
  @new_user.budget -= @item.initial_price + @bid.amount
  respond_to do |format|
    if @bid.save
      format.html { redirect_to @item, notice: 'Your item has been updated.'}
    else
      format.html { render action: 'new' }
    end
  end
end

  private

  def bid_params
    params[:bid][:user_id] = current_user.id
    params.require(:bid).permit(:user_id, :item_id, :amount).merge(user_id: current_user.id, item_id: @item.id)
  end
end
