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
  cart.each{|clearance|
    if cart.keys.include?(clearance[:item])
      
  }
end

def checkout(cart, coupons)
  # code here
end
