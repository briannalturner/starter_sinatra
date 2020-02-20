require_relative '../../config/environment'



class IcecreamsController < Sinatra::Base

    set :views, 'app/views/icecream'

    get '/icecreams' do
        @icecreams = Icecream.all

        erb :index
    end



end