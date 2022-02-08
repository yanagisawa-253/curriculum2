class CartItem < ApplicationRecord
  
  def sum_of_price
    item.with_tax_price * amount
  end 
end
