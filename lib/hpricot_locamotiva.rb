#http://superinscricoes.com.br/novo/resultados.php?acao_buscar=1&acao_site=resultados&id_cliente=12&id_evento=44&nome_atleta=glauco%20de%20oliveira
#require 'rubygems'
#require 'hpricot'
#require 'open-uri'

#doc = Hpricot(open("http://www.sno.phy.queensu.ca/~phil/exiftool/TagNames/EXIF.html"))

#doc = open("EXIF.html") { |f| Hpricot(f) }

#rows = []

#(doc/"table.inner//tr").each do |row|
#    cells = []
#    (row/"td").each do |cell|
#       
#        if (cell/" span.s").length > 0
#              values = (cell/"span.s").inner_html.split('<br />').collect{ |str| 
#              pair = str.strip.split('=').collect{|val| val.strip}
#              Hash[pair[0], pair[1]]
#            }
#            
#            if(values.length==1)
#              cells < < cell.inner_text
#            else
#              cells << values
#            end
#            
#        elsif
#            cells << cell.inner_text
#        end
#    end
#    rows << cells
#    
#    puts rows
#    
#end
 require "hpricot" # need hpricot and open-uri
 require "open-uri"

 doc = Hpricot(open("http://www.fox.com/familyguy/index.htm"))

 # change the CSS class on list element ul
 (doc/"ul.site-nav").set("class", "new-site-nav")

 # remove the header
 (doc/"#header").remove

 # print the altered HTML
 puts doc

