require "hpricot" 
require "open-uri"
 
class HpTeste < ActiveRecord::Base

  def abre
   doc = Hpricot(open("http://www.fox.com/familyguy/index.htm"))

   # change the CSS class on list element ul
   (doc/"ul.site-nav").set("class", "new-site-nav")

   # remove the header
   (doc/"#header").remove

   # print the altered HTML
   doc
  end
end
