require_relative '../../config/environment'

class ShopsController < Sinatra::Base

    set :views, 'app/views/shops'
    set :method_override, true

    get '/shops' do
        @shops = Shop.all
        
        erb :index
    end

end