# encoding: UTF-8
require 'nokogiri'
require 'open-uri'

(0..599).each do |n|
    print "\nG #{n}.."
    doc = Nokogiri::HTML(open("http://dica.x-aas.net/dica/en/one-stop-services?page=#{n}"),nil, 'utf-8')
    trlist = doc.xpath('//*[@id="block-system-main"]/div/div/div[2]/table/tbody/tr')
    File.open("./#{n}.csv","w:UTF-8") do |f|
        trlist.each do |tr|
            tdlist = tr.search('td')
            f.puts [tdlist[0].content.strip, tdlist[2].content.strip, tdlist[3].content.strip].join("^")
        end
    end
    print "X"
end
