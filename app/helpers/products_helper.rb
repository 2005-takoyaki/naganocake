module ProductsHelper

def converting_to_jpy(price)
    "#{price.to_s(:delimited, delimiter: ',')}"
end

def addTax(money,rate)
   taxed_money =  (money*rate).round
   "#{taxed_money.to_s(:delimited, delimiter: ',')}"

end

end
