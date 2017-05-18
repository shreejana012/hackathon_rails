class HomesController < ApplicationController
  def index
    @item = Item.all
  end
end
