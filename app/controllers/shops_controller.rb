require_relative '../../config/environment'

class ShopsController < Sinatra::Base

    set :views, 'app/views/shops'
    set :method_override, true

    get '/shops' do
        @shops = Shop.all

        erb :index
    end

    get '/shops/new' do
        erb :new
    end

    post '/shops' do
        @name = params[:name]
        @location = params[:location]
        @shop = Shop.find_or_create_by(name: @name, location: @location)
        redirect "/shops/#{@shop.id}"
    end

    get '/shops/:id' do
        @shop = Shop.find(params[:id])
        erb :show
    end

    delete '/shops/:id' do
        @shop = Shop.find(params[:id])
        @shop.destroy
        redirect '/shops'
    end

    get '/shops/:id/edit' do
        @shop = Shop.find(params[:id])
        erb :edit
    end

    post '/shops/:id' do
        @shop = Shop.find(params[:id])
        @name = params[:name]
        @location = params[:location]
        @shop.update(name: @name, location: @location)

        redirect "/shops/#{@shop.id}"
    end

    patch '/shops/:id' do
        @shop = Shop.find(params[:id])
        @icecream = Icecream.find_by(flavor: params[:icecreams])
        if @icecream
            Relationship.find_or_create_by(shop_id: @shop.id, icecream_id: @icecream.id)
        end

        redirect "/shops/#{@shop.id}"
    end

end