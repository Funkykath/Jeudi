require 'rubygems'
require 'nokogiri'
require 'open-uri'

def députés_list()
	page = Nokogiri::HTML(open("https://www.voxpublic.org/spip.php?page=annuaire&cat=deputes&pagnum=600"))
	@députés_email = []
	@prénom = []
 	page.xpath('//a').each do |x|
		if x.to_s.include?('"mailto:"')
			@députés_email << x.text
		elsif x.to_s.include?('class="titre_normal"')
			@prénom << x.text
		end
	end
return @prénom, @députés_email
end

p députés_list
hashi = Hash[@prénom.zip(@députés_email)]
puts hashi