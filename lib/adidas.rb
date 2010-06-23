require "hpricot" 
require "open-uri"

class Adidas

  def build_result(race, athlete)
    fill_result(slice_by_column(result_page(race, athlete)), race, athlete)
  end

  def result_page(race, athlete)
    Hpricot(open(page race, athlete)).search("//td[@class='tabela_celula']")
  end
  
  def page(race, athlete)
    name = self.blank_ascii_to_hexa athlete.name
    url = "http://superinscricoes.com.br/novo/resultados.php?"
    action = url + "acao_buscar=1&acao_site=resultados&id_cliente=12&id_evento=#{race.event_id}&nome_atleta=#{name}"
  end

  def blank_ascii_to_hexa(field)
    field.map {|item| item.gsub(/[' ']/,'%20')}
  end
   
  def slice_by_column(result_page)
    result_page.map { |item| each_atleta = item.inner_html }
  end

  def fill_result(html_fields, race, athlete)
    return if !html_fields[0]
      r = Result.new
      name = html_fields[1]
      date = race.date.to_date.to_formatted_s.delete("-") #Pegar a dados do evento http://superinscricoes.com.br/novo/index.php?acao_site=evento_exibir&id_evento=44
      r.start_number = html_fields[3].to_i
      r.category = html_fields[11]
      r.team = 'Locamotiva'      
      r.liquid_time = date + html_fields[9].chop.chop.delete(':').delete('.') unless nil
      r.official_time = date + html_fields[15].chop.chop.delete(':').delete('.') unless nil
      r.class_general = html_fields[17]
      r.class_sex = html_fields[21]
      r.class_category = html_fields[19]
      r.pace = date + html_fields[23].delete(':')[2..5]
      r.distance =  html_fields[13] + "m"
      r.substitute = ""
      r.notes = ""
      r.race_id = race.id
      r.athlete_id = athlete.id
      puts "----------- #{name} -----", r.inspect, "-----------"
      r.save
  end
  
  def search_all_athletes(race)
    athletes = Athlete.find_all_by_id 1..7

    athletes.each do |athlete|
      build_result(race, athlete)
    end
    
  end
  
end