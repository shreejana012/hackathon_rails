class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create,:edit]
  def index
    @item = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = current_user.items.build(item_params)
    @item.save
    if @item.valid?
      flash[:success] = "Your item has been successfully created and sent to the admin for verification"
      redirect_to items_path(@bid,item_id: @item.id)
    else
      render :new
    end
  end

  def edit
    @items = Item.find(parmas[:id])
  end
  def show
    @item = Item.find(params[:id])
    @bid = Bid.find_by_item_id(@item.id)
  end
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Your item has been updated.'}
      else
        format.html { render action: 'edit'}
      end
    end
  end
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url }
    end
  end

  private

  def item_params
    params.require(:item).permit(
      :user_id,
      :title,
      :painter,
      :description,
      :initial_price,
      :shipping_charges,
      :photo, bids_attributes: [:amount, :user_id, :item_id])
  end
end
