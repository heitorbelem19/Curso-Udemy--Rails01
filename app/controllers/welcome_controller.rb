class WelcomeController < ApplicationController
  def index
    #cookies[:curso] = "Ruby on Rails [COOKIE]"
    @nome = params[:nome]
    @curso = params[:curso]
  end
end
