# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


coins = [
          {
            description: 'Bitcoin',
            acronym: 'BTC',
            url_image: 'https://upload.wikimedia.org/wikipedia/commons/c/cf/Bitcoin.com_logo.png'
          },
          {
            description: 'Ethereum',
            acronym: 'ETH',
            url_image: 'https://pngimage.net/wp-content/uploads/2018/05/ethereum-png-7.png'
          },
          {
            description: 'Dash',
            acronym: 'DASH',
            url_image: 'https://www.ultimatemoney.com.au/wp-content/uploads/2018/06/dash-coin.png'
          }
        ]
spinner = TTY::Spinner.new("[:spinner] Criando Moedas", format: :bouncing_ball)
spinner.auto_spin   
  coins.each do |coin|
    sleep(1)
    Coin.find_or_create_by(coin)
  end

spinner.success("(Concluído!)") 