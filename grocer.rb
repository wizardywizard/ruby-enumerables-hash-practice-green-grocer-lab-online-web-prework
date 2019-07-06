def consolidate_cart(cart)
  foods = {}
  cart.each{|item|
    if foods[item.keys[0]]
      foods[item.keys[0]][:count] += 1
    else 
      foods[item.keys[0]] = {:price => item.values[0][:price], :clearance => item.values[0][:clearance], :count => 1}
    end
  }
   foods
end

def apply_coupons(cart, coupons)
  coupons.each{|coupon| 
    if cart.keys.include?(coupon[:item])
      if coupon[:num] <= cart[coupon[:item]][:count]
        item_name = "#{coupon[:item]} W/COUPON"
        if cart[item_name]
          cart[item_name][:count] += coupon[:num]
        else 
          cart[item_name] = {:price => coupon[:cost]/coupon[:num], :clearance => cart[coupon[:item]][:clearance], :count => coupon[:num]}
        end
        cart[coupon[:item]][:count] -= coupon[:num]
      end
    end
  }
  cart
end

def apply_clearance(cart)
   cart.keys.each do |item|
    if cart[item][:clearance]
      cart[item][:price] = (cart[item][:price]*0.80).round(2)
    end
  end
  cart
end

def checkout(cart, coupons)
  cons_cart = consolidate_cart(cart)
  app_cou = apply_coupons(cart, coupons)
  app_cle = apply_clearance(cart)
  total = 0.00
  cart_with_discounts_applied.keys.each do |item|
    
end
#consolidate cart array into a hash then apply coupons if the proper number is present
#apply 20% discount if items are on clearance before calculating the total
#apply a 10% discount if the total is over $100













