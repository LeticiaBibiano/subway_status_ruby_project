# A boot class | Uma classe de inicialização
class Start
  def self.startup

    puts ",--.   ,--.       ,--.                   ,---. ,------.                           "  
    puts "|   `.'   |,---.,-'  '-,--.--.,---.     '   .-'|  .--. '                          "  
    puts "|  |'.'|  | .-. '-.  .-|  .--| .-. |    `.  `-.|  '--' |                          "  
    puts "|  |   |  \   --.  |  | |  |  ' '-' '    .-'    |  | --'     .--.    .--.    .--.  "  
    puts "`--'   `--'`----' `--' `--'   `---'     `-----'`--'         '--'    '--'    '--'  "

    sleep 1
    
    system('clear')

    puts "Para fazer sua busca"
    print "."
    sleep 1
    print "."
    sleep 1
    print "."
    sleep 1
    puts "Escreva o nome da linha (ex: linha 2) ou digite 'listar' para receber atualizações de todas as linhas"


  end
end