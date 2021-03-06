require_relative '../../config/environment'



class IcecreamsController < Sinatra::Base

    set :views, 'app/views/icecream'
    set :method_override, true

    get '/icecreams' do
        @icecreams = Icecream.all

        erb :index
    end

    get '/icecreams/new' do
        erb :new
    end

    post '/icecreams' do
        @flavor = params[:flavor]
        @brand = params[:brand]
        @price = params[:price]
        @icecream = Icecream.find_or_create_by(flavor: @flavor, brand: @brand, price: @price)
        redirect "/icecreams/#{@icecream.id}"
    end

    get '/icecreams/:id/edit' do
        @icecream = Icecream.find(params[:id])

        erb :edit
    end

    get '/icecreams/:id' do
        @icecream = Icecream.find(params[:id])
        erb :show
    end

    delete '/icecreams/:id' do
        @icecream = Icecream.find(params[:id])
        @icecream.destroy
        redirect "/icecreams"
    end

    post '/icecreams/:id' do
        @icecream = Icecream.find(params[:id])
        @icecream.update(flavor: params[:flavor], brand: params[:brand], price: params[:price])

        redirect "/icecreams/#{@icecream.id}"
    end

    patch '/icecreams/:id' do
        @icecream = Icecream.find(params[:id])
        @shop = Shop.find_by(name: params[:name])
        if @shop
            Relationship.find_or_create_by(shop_id: @shop.id, icecream_id: @icecream.id)
        end

        redirect "/shops/#{@icecream.id}"
    end

    
end