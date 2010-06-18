require "hpricot" 
require "open-uri"

class Adidas

  def athlete_result(event, athlete)
    athlete_name = self.search_athlete athlete
    event_page = Hpricot(open(page event, athlete_name))
    x = each_athlete event_page
    create_result build_result x
  end

  def search_athlete(athlete)
    athlete.name.map {|dados| dados.gsub(/[' ']/,'%20')}
  end

  def page(event, athlete_name)
    url = "http://superinscricoes.com.br/novo/resultados.php?"
    action = url + "acao_buscar=1&acao_site=resultados&id_cliente=12&id_evento=#{event}&nome_atleta=#{athlete_name}"
  end
  
  def each_athlete(event_page)
    event_page.search("//td[@class='tabela_celula']")
  end
  
  def build_result(each_athlete)
    atleta = []
    i = 0
    
    each_athlete.each do |item|
      atleta[i] = item.inner_html
      i = i + 1
    end
    atleta
  end

  def create_result(build_result)
    r = Result.new
    # name = atleta[1]
    atleta = build_result
    date = "20100117" #Pegar a dados do evento http://superinscricoes.com.br/novo/index.php?acao_site=evento_exibir&id_evento=44
    # id = 0
    r.start_number = atleta[3].to_i
    # r.category = atleta[11]
    # r.team = 'Locamotiva' #atleta[7]      
    # r.liquid_time = date + atleta[9].chop.chop.delete(':').delete('.') unless nil
    # r.official_time = date + atleta[15].chop.chop.delete(':').delete('.') unless nil
    # r.class_general = atleta[17]
    # r.class_sex = atleta[21]
    # r.class_category = atleta[19]
    # r.pace = date + atleta[23].delete(':')[2..5]
    r.distance =  atleta[13] + "m"
    r.substitute = ""
    r.notes = ""
    r.race_id = 39
    r.athlete_id = 1 #id_locamotiva  #find_id_athlete
    r
  end


  def abre2(athlete_name, id_locamotiva)
    
    athlete_name = athlete_name.map {|dados| dados.gsub(/[' ']/,'%20')}

    toda_pagina = Hpricot(open("http://superinscricoes.com.br/novo/resultados.php?acao_buscar=1&acao_site=resultados&id_cliente=12&id_evento=44&nome_atleta=#{athlete_name[0]}"))

    cada_atleta = toda_pagina.search("//td[@class='tabela_celula']") # conteudo de cada atleta

    atleta = []
    i = 0
    
    cada_atleta.each do |item|
      atleta[i] = item.inner_html
      i = i + 1
    end

    name = atleta[1]
    date = "20100117" #Pegar a dados do evento http://superinscricoes.com.br/novo/index.php?acao_site=evento_exibir&id_evento=44
    id = 0
    start_number = atleta[3]
    category = atleta[11]
    team = 'Locamotiva' #atleta[7]      
    liquid_time = date + atleta[9].chop.chop.delete(':').delete('.') unless nil
    official_time = date + atleta[15].chop.chop.delete(':').delete('.') unless nil
    class_general = atleta[17]
    class_sex = atleta[21]
    class_category = atleta[19]
    pace = date + atleta[23].delete(':')[2..5]
    distance =  atleta[13] + "m"
    substitute = ""
    notes = ""
    athlete_id = id_locamotiva  #find_id_athlete
    race_id = 39

    #Data in SuperIncricoes format
#    hash = {
#            :start_number => atleta[3],
#            :sex => '',
#            :team => atleta[7],
#            :liquid_time => date + atleta[9].chop.chop.delete(':').delete('.'),
#            :category => atleta[11],
#            :distance =>  atleta[13] + "m",
#            :control_time => date  #verificar como encontrar este tempo
#            :official_time => date + atleta[15].chop.chop.delete(':').delete('.'),
#            :class_general => atleta[17],
#            :class_category => atleta[19],
#            :class_sex => atleta[21],
#            :pace => date + atleta[23].delete(':')[2..5],
#            :velocity => ""
#            }

#    result = "id, start_number, category, team, liquid_time, official_time, class_general, class_sex, class_category, pace, distance, substitute, notes, athlete_id, race_id"            
    result = "#{id},#{start_number},'#{category}','#{team}',#{liquid_time},#{official_time},#{class_general},#{class_sex},#{class_category},#{pace},'#{distance}','#{substitute}','#{notes}',#{athlete_id},#{race_id}"

#  1,518603,"M3539","Locamotiva",20081028004627,20081028004827,973,916,166,20081028043800,"10Km",,,1,3
  end


  
  def find_id_athlete
    athlete = Athlete.new 
    athlete.find_by_name(athlete)
  end

  def busca_todos_por_nome
#    lista_atletas = [ "Glauco Oliveira",
#                      "Fernando Amorim",
#                      "Mauricio Amorim",
#                      "Luciano Silva",
#                      "Renato Lopes",
#                      "Rodrigo Ortiz",
#                      "Thiago Oquendo",
#                      "Adauto Vieira",
#                      "Maciel Moraes",
#                      "Paula Carrasco",
#                      "Jennifer Melo",
#                      "Daniele Dias",
#                      "Danielle Dias",
#                      "Mauricio Aniche",
#                      "Allisson Soares"]
a = []
a << abre2("Glauco de Oliveira Pinto", 11)
a << abre2("Fernando Hamasaki de Amorim", 2) unless nil
a << abre2("Patricia Hamasaki de Amorim", 14) unless nil
a << abre2("Mauricio Amorim", 1)
a << abre2("Luciano Silva", 4)
# a << abre2("Rodrigo Ortiz", 13)
# a << abre2("THIAGO DANILO ROLIM OQUENDO", 3)
# a << abre2("Adauto Vieira Diniz Junior", 52)
# a << abre2("Maciel Moraes", 46)
# a << abre2("Paula Carrasco", 49)
# #a << abre2 "Jennifer Melo"
# a << abre2("Daniele Dias", 44)
# a << abre2("Mauricio Finavaro Aniche", 60)
# a << abre2("Allisson Soares", 34)
#a << abre2("Renato Lopes") unless nil
    a                  
  end  
 
 
    def bid(id_athlete)
    
    id_athlete = id_athlete.map {|dados| dados.gsub(/[' ']/,'%20')}

    doc = Hpricot(open("http://superinscricoes.com.br/novo/resultados.php?acao_buscar=1&acao_site=resultados&id_cliente=12&id_evento=44&num_peito=#{id_athlete[0]}"))
#doc = Hpricot(open("http://superinscricoes.com.br/novo/resultados.php?acao_buscar=1&acao_site=resultados&id_cliente=12&id_evento=44&id_resultado=#{id_athlete[0]}"))
    cada = doc.search("//td[@class='fundo_nome_campo2']")      

    atleta = []
    i = 0
    
    cada.each do |dados|
      atleta[i] = dados.inner_html
      i = i + 1
    end

    name = atleta[1]
    date = "20100117"
    id = 0
    start_number = atleta[3]
    category = atleta[11]
    team = 'Locamotiva' #atleta[7]      
    liquid_time = date + atleta[9].chop.chop.delete(':').delete('.')
    official_time = date + atleta[15].chop.chop.delete(':').delete('.')
    class_general = atleta[17]
    class_sex = atleta[21]
    class_category = atleta[19]
    pace = date + atleta[23].delete(':')[2..5]
    distance =  atleta[13] + "m"
    substitute = ""
    notes = ""
    athlete_id = 0  #find_id_athlete
    race_id = 39

    p " passou aquiiiiiiiiiiii"
    result = "Nome: #{nome},#{id},#{start_number},'#{category}','#{team}',#{liquid_time},#{official_time},#{class_general},#{class_sex},#{class_category},#{pace},'#{distance}','#{substitute}','#{notes}',#{athlete_id},#{race_id}/n"

  end

  def find_date(athlete_name)
    athlete_name = athlete_name.map {|dados| dados.gsub(/[' ']/,'%20')}

    toda_pagina = Hpricot(open("http://superinscricoes.com.br/novo/resultados.php?acao_buscar=1&acao_site=resultados&id_cliente=12&id_evento=44&nome_atleta=#{athlete_name[0]}"))

    cada_atleta = toda_pagina.search("//td[@class='tabela_celula']") # conteudo de cada atleta
    
    atleta = []
    i = 0
    
    cada_atleta.each do |item|
      atleta[i] = item.inner_html
      i = i + 1
    end
  end

end
