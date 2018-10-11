require 'rubygems'
require 'nokogiri'
require 'open-uri'
   
def get_the_email_of_a_townhal_from_its_webpage(url)
page = Nokogiri::HTML(open(url))
e_mail = []
e_mail << page.xpath('///html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text
return p e_mail
end

a = "http://annuaire-des-mairies.com/95/vaureal.html"
get_the_email_of_a_townhal_from_its_webpage(a)

def get_the_town_list
page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/95/"))
town = []
kath = "http://annuaire-des-mairies.com/95/"
page.xpath('/html/body/pre/a').each do |td|
town << kath + td["href"]
end
return town[5..-1]
end

get_the_town_list.each do |x|
	get_the_email_of_a_townhal_from_its_webpage(x)
end






