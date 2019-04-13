class HomeListingsController < ApplicationController
    # get homes/new to render a form to create a new home
    get '/home_listings/new' do
        erb :'/home_listings/new'
    end
    # post home to create a new journal entry
    post '/home_listings' do
        #create a new home listing and save it to the DB
        #only save if is has some content
        #only create if the user is logged in 
        if !logged_in?
            redirect '/'
        end
         #only save if the listing has content
        if params[:home_address] != "" && params[:bedroom] != "" && params[:bathroom] != "" && params[:price] != "" && params[:description] != ""
            #create a new entry
            @home_listing = Home.create(home_address: params[:home_address], bedroom: params[:bedroom], bathroom: params[:bathroom], price: params[:price], description: params[:description], user_id: current_user.id)

            redirect "/home_listings/#{@home_listing.id}"
        else
            redirect '/home_listings/new'
        end
    end
    # show route for a home listing
    get '/home_listings/' do

    end

    # index route for all home listings
end