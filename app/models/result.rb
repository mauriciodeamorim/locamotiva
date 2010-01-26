class Result < ActiveRecord::Base
  belongs_to :race
  belongs_to :athlete
 
  def abre2(atleta, id_locamotiva)
    
    atleta = atleta.map {|dados| dados.gsub(/[' ']/,'%20')}

#    doc = []
#    
#    atleta.each do |xxx|
#      doc = Hpricot(open("http://superinscricoes.com.br/novo/resultados.php?acao_buscar=1&acao_site=resultados&id_cliente=12&id_evento=44&nome_atleta=#{xxx}"))      
#    end

    doc = Hpricot(open("http://superinscricoes.com.br/novo/resultados.php?acao_buscar=1&acao_site=resultados&id_cliente=12&id_evento=44&nome_atleta=#{atleta[0]}"))

    cada = doc.search("//td[@class='fundo_nome_campo2']")      

    atleta = []
    i = 0
    
    cada.each do |dados|
      atleta[i] = dados.inner_html
      i = i + 1
    end

    date = "20100117"
    id = 0
    start_number = atleta[3]
    category = atleta[11]
    team = atleta[7]      
    liquid_time = date + atleta[9].chop.chop.delete(':').delete('.')
    official_time = date + atleta[15].chop.chop.delete(':').delete('.')
    class_general = atleta[17]
    class_sex = atleta[21]
    class_category = atleta[19]
    pace = date + atleta[23].delete(':')[2..5]
    distance =  atleta[13] + "m"
    substitute = ""
    notes = ""
    athlete_id = id_locamotiva
    race_id = 38

#    result = "id, start_number, category, team, liquid_time, official_time, class_general, class_sex, class_category, pace, distance, substitute, notes, athlete_id, race_id"            
    result = "#{id},#{start_number},#{category},#{team},#{liquid_time},#{official_time},#{class_general},#{class_sex},#{class_category},#{pace},#{distance},#{substitute},#{notes},#{athlete_id},#{race_id}"

#  1,518603,"M3539","Locamotiva",20081028004627,20081028004827,973,916,166,20081028043800,"10Km",,,1,3
  end

  def busca_todos
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
a << abre2("Glauco de Oliveira", 0)
a << abre2("Fernando Hamasaki", 0) unless nil
a << abre2("Mauricio Amorim", 1)
a << abre2("Luciano Silva", 0)
#a << abre2 "Rodrigo Ortiz"
#a << abre2 "THIAGO DANILO ROLIM OQUENDO"
#a << abre2 "Adauto Vieira"
#a << abre2 "Maciel Moraes"
#a << abre2 "Paula Carrasco"
#a << abre2 "Jennifer Melo"
#a << abre2 "Daniele Dias"
#a << abre2 "Danielle Dias"
#a << abre2 "Mauricio Aniche"
#a << abre2 "Allisson Soares"
#a << abre2("Renato Lopes") unless nil
                      
a                      
  end

private
  def self.last_race
    race = Race.find(:last, :order => "date ASC")
    
  end
  
  def self.by_race
    self.last_race.results.find(:all, :order => "class_general ASC")
  end
end
