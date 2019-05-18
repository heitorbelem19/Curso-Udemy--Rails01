namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Apagando BD..."){ %x(rails db:drop) }
      show_spinner("Criando BD..."){ %x(rails db:create) }
      show_spinner("Migrando BD..."){ %x(rails db:migrate) }
      %x(rails dev:add_mining_types) 
      %x(rails dev:add_coins)
    else
      puts 'Não está em modo desenvolvimento'
    end
  end

  desc "Adiciona novas moedas"
  task add_coins: :environment do
    show_spinner("Cadastrando Moedas...") do
      coins = [
        {
          description: 'Bitcoin',
          acronym: 'BTC',
          url_image: 'https://upload.wikimedia.org/wikipedia/commons/c/cf/Bitcoin.com_logo.png',
          mining_type: MiningType.find_by(acronym: 'PoW')
        },
        {
          description: 'Ethereum',
          acronym: 'ETH',
          url_image: 'https://pngimage.net/wp-content/uploads/2018/05/ethereum-png-7.png',
          mining_type: MiningType.find_by(acronym: 'PoS')
        },
        {
          description: 'Dash',
          acronym: 'DASH',
          url_image: 'https://www.ultimatemoney.com.au/wp-content/uploads/2018/06/dash-coin.png',
          mining_type: MiningType.find_by(acronym: 'PoC')      
        },
        {
          description: 'Iota',
          acronym: 'IOT',
          url_image: 'https://s2.coinmarketcap.com/static/img/coins/200x200/1720.png',
          mining_type: MiningType.find_by(acronym: 'PoS')      
        },
        {
          description: 'ZCash',
          acronym: 'ZEC',
          url_image: 'https://www.cryptocompare.com/media/351360/zec.png',
          mining_type: MiningType.find_by(acronym: 'PoW')      
        }
      ]
      coins.each do |coin|
        sleep(0.5)
        Coin.find_or_create_by!(coin)
      end
    end
  end

  desc "Adiciona novos Tipos de Mineração"
  task add_mining_types: :environment do
    show_spinner("Cadastrando Tipos de Mineração") do
      mining_types = [  
        {description: "Proof of Work", acronym: "PoW"},
        {description: "Proof of Stake", acronym: "PoS"},
        {description: "Proof of Capacity", acronym: "PoC"}
      ]
      mining_types.each do |mining_type|
        sleep(0.5)
        MiningType.find_or_create_by!(mining_type)
      end
    end
  end

  private
    def show_spinner(msg_start, msg_end = "Concluído!")
      spinner = TTY::Spinner.new("[:spinner] #{msg_start}", format: :bouncing_ball)
      spinner.auto_spin
      yield
      spinner.success("(#{msg_end})")   
    end

end