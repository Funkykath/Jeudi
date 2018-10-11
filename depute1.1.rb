require 'rubygems'
require 'nokogiri'
require 'open-uri'

def députés_list()
	page = Nokogiri::HTML(open("https://www.voxpublic.org/spip.php?page=annuaire&cat=deputes&pagnum=600"))
	@deputes_name = []
	page.xpath('/html/body/div[1]/main/div/div/div/ul[1]/li[1]/h2').each do |x|
	@deputes_name << x.text
	end
	return @deputes_name
end
def deputes_email
	page = Nokogiri::HTML(open("https://www.voxpublic.org/spip.php?page=annuaire&cat=deputes&pagnum=600"))
	@deputes_emails = []
	page.xpath('/html/body/div[1]/main/div/div/div/ul[1]/li[5]/a[1]').each do |x|
	@deputes_emails << x.text
	end
	return @deputes_emails
end

hashi = Hash[députés_list.zip(deputes_email)]
puts hashi