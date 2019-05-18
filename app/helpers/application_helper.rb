module ApplicationHelper

    def locale
        I18n.locale == :en ? "EUA" : "Português-BR"
    end

    def date_br(date_usa)
        date_usa.strftime("%d/%m/%Y")
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
