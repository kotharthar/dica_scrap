# encoding: UTF-8
require 'nokogiri'
require 'open-uri'

# Iterate for 600 pages.
(0..599).each do |n|
    print "\nG #{n}.."

    # Get the document and parsed.
    doc = Nokogiri::HTML(open("http://dica.x-aas.net/dica/en/one-stop-services?page=#{n}"),nil, 'utf-8')

    # Get table rows.
    trlist = doc.xpath('//*[@id="block-system-main"]/div/div/div[2]/table/tbody/tr')

    # Create file for currentlys crapped page
    File.open("./#{n}.csv","w:UTF-8") do |f|
        # For each table row
        trlist.each do |tr|
            # Get the table cells
            tdlist = tr.search('td')

            # Write out to CSV file
            f.puts [tdlist[0].content.strip, tdlist[2].content.strip, tdlist[3].content.strip].join("^")

        end
    end
    print "X"
end
