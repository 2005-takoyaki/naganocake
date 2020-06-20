module Admin::ProductsHelper
def sales(sales)
	if sales
		'販売中'
	else
		'販売停止中'
	end
end

def converting_to_jpy(price)
    "#{price.to_s(:delimited, delimiter: ',')}円"
end
end

