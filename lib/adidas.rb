require "hpricot" 
require "open-uri"

class Adidas

  def build_result(race, athlete)
    fill_result(result_by_name(each_athlete event_page(race, athlete)))
  end

  def event_page(race, athlete)
    Hpricot(open(page race, athlete))    
  end
  
  def page(race, athlete)
    name = self.blank_ascii_to_hexa athlete.name
    url = "http://superinscricoes.com.br/novo/resultados.php?"
    action = url + "acao_buscar=1&acao_site=resultados&id_cliente=12&id_evento=#{race.event_id}&nome_atleta=#{name}"
  end

  def blank_ascii_to_hexa(field)
    field.map {|item| item.gsub(/[' ']/,'%20')}
  end
  
  def each_athlete(event_page)
    event_page.search("//td[@class='tabela_celula']")
  end
   
  def result_by_name(each_athlete)
    atleta = []
    i = 0
    
    each_athlete.each do |item|
      atleta[i] = item.inner_html
      i = i + 1
    end
    atleta
  end

  def fill_result(build_result)
    r = Result.new
    atleta = build_result
    name = atleta[1]
    date = "20100117" #Pegar a dados do evento http://superinscricoes.com.br/novo/index.php?acao_site=evento_exibir&id_evento=44
    r.start_number = atleta[3].to_i
    r.category = atleta[11]
    r.team = 'Locamotiva' #atleta[7]      
    r.liquid_time = date + atleta[9].chop.chop.delete(':').delete('.') unless nil
    r.official_time = date + atleta[15].chop.chop.delete(':').delete('.') unless nil
    r.class_general = atleta[17]
    r.class_sex = atleta[21]
    r.class_category = atleta[19]
    r.pace = date + atleta[23].delete(':')[2..5]
    r.distance =  atleta[13] + "m"
    r.substitute = ""
    r.notes = ""
    r.race_id = 39
    r.athlete_id = 1 #id_locamotiva  #find_id_athlete
    r
  end
# result = "#{id},#{start_number},'#{category}','#{team}',#{liquid_time},#{official_time},#{class_general},#{class_sex},#{class_category},#{pace},'#{distance}','#{substitute}','#{notes}',#{athlete_id},#{race_id}"
#  1,518603,"M3539","Locamotiva",20081028004627,20081028004827,973,916,166,20081028043800,"10Km",,,1,3
end