module ApplicationHelper
    def date_br(date_us)
        date_us.strftime("%d/%m/%Y")
    end

    def environment(_env)
        if(_env == 'development')
            'Desenvolvimento'
        elsif(_env == 'production')
            'Produção'
        else
            'Teste'
        end
    end
end
