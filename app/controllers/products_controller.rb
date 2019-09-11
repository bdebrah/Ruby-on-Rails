class ProductsController < ApplicationController
  def phones
    @phones = Item.where(product: "Phone")
    if params[:from] && params[:to]
      from = params[:from]
      to = params[:to]
      @phones = @phones.where(price: from..to)
    else
      @phones
    end
    if params[:search]
      search = params[:search]
      @phones = @phones.where('name LIKE ?', "%#{search}%")
    else
      @phones
    end
  end

  def headphones
    @headphones = Item.where(product: "Headphone")
    if params[:from] && params[:to]
      from = params[:from]
      to = params[:to]
      @headphones = @headphones.where(price: from..to)
    else
      @headphones
    end
    if params[:search]
      search = params[:search]
      @headphones = @headphones.where('name LIKE ?', "%#{search}%")
    else
      @headphones
    end
  end
  
  def chargers
    @chargers = Item.where(product: "Charger")
    if params[:from] && params[:to]
      from = params[:from]
      to = params[:to]
      @chargers = @chargers.where(price: from..to)
    else
      @chargers
    end
    if params[:search]
      search = params[:search]
      @chargers = @chargers.where('name LIKE ?', "%#{search}%")
    else
      @chargers
    end
  end
end
