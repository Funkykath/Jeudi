require 'rubygems'
require 'nokogiri'
require 'open-uri'

def deputes_list
	page = Nokogiri::HTML(open("https://www.voxpublic.org/spip.php?page=annuaire&cat=deputes&pagnum=600"))
	@deputes_name = []
	page.xpath('//h2').each do |x|
		if x.to_s.include?('class="titre_normal"')
			@deputes_name << x.text.gsub('Mme ', '').gsub('M ', '')
		end
	end
	return @deputes_name
end


def deputes_email
	page = Nokogiri::HTML(open("https://www.voxpublic.org/spip.php?page=annuaire&cat=deputes&pagnum=600"))
	@deputes_emails = []
	page.xpath('//a').each do |x|
		if x.to_s.include?("@assemblee-nationale.fr") && x.text.to_s.include?('secretariat-blanchet') == false
			@deputes_emails << x.text
		end
	end
	return @deputes_emails
end

nom = deputes_list
email = deputes_email
i = 0
tab = []
deputes_email.each do
	tab << { "name" => nom[i], "email" => email[i] }
	i += 1
end

puts tab