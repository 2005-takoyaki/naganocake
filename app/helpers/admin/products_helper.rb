module Admin::ProductsHelper

def sales(sales)
	if sales
		'販売中'
	else
		'販売停止中'
	end
end

def converting_to_jpy(price)
    "#{price.to_s(:delimited, delimiter: ',')}"
end

def addTax(money,rate)
   taxed_money =  (money*rate).round
   "#{taxed_money.to_s(:delimited, delimiter: ',')}"

end

def jpy(price)
    "(#{price.to_s(:delimited, delimiter: ',')}）円"
end

def embedded_svg filename, options={}
    file = File.read(Rails.root.join('app', 'assets', 'images', filename))
    doc = Nokogiri::HTML::DocumentFragment.parse file
    svg = doc.at_css 'svg'
    if options[:class].present?
      svg['class'] = options[:class]
    end
    doc.to_html.html_safe
end


end

