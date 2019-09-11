class NavbarController < ApplicationController
  def home
    @display = Item.all.sample(3)
  end

  def login
  end

  def products
  end

  def contact
  end
  
  def cart
    @cart = current_user.items
    @total = 0
  end
  
  
end
