#Uma classe para listar todas as informações (estações e status) de uma vez.
#A class to list all information (station and status) at once.
require 'nokogiri'
require 'open-uri'
require 'byebug'
require_relative 'startup.rb'

class SubwayStatus

  def initialize

    Start.startup
    
    document = Nokogiri::HTML(open('http://www.metro.sp.gov.br/Sistemas/direto-do-metro-via4/MetroStatusLinha/mobile/smartPhone/diretoDoMetro.aspx'))

    @content = document.css('div.status-linhas li') #Specific path
    
  end

  def complete_info
    lines.zip(status).to_h.map { |name, status|{ name: name, status: status }}
  end

  def lines
    @content.search('p strong').map do |line| #use .search
      line.content.strip.tr("\t/\r/\n", "")
    end    
  end

  def status
    status = @content.xpath("//li//div//p//a") #use .xpath

    status.map do |s|
      s.content.strip.tr("\t/\r/\n", "") #.strip => remove the blank spaces | .tr => replace single characters
    end        
  end

  def subway_search

    user_input = gets.chomp.capitalize #Capitalize the first letter.

    if user_input == "Listar"
      puts complete_info      
    else
      answer = find_line(user_input)
      if answer.any? 
        puts answer.first.fetch(:status, "")
      else
        puts "Ops.. algo deu errado! Tente digitar novamente."

        subway_search
      end
    end
  end 

  private

  def find_line(user_input)
    complete_info.select { |iten| iten[:name] == user_input }    
  end
end