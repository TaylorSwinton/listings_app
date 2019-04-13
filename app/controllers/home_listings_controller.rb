class HomeListingsController < ApplicationController
    # get homes/new to render a form to create a new home
    get '/home_listings/new' do
        erb :'/home_listings/new'
    end
    # post home to create a new home entry
    post '/home_listings' do
        #create a new home listing and save it to the DB
        #only save if is has some content
        #only create if the user is logged in 
        if !logged_in?
            redirect '/'
        end
         #only save if the listing has content
        if params[:home_address] != "" && params[:bedroom] != "" && params[:bathroom] != "" && params[:price] != "" && params[:description] != ""
            #create a new listing
            @home_listing = Home.create(home_address: params[:home_address], bedroom: params[:bedroom], bathroom: params[:bathroom], price: params[:price], description: params[:description], user_id: current_user.id)

            redirect "/home_listings/#{@home_listing.id}"
        else
            redirect '/home_listings/new'
        end
    end
    # show route for a home listing
    get '/home_listings/:id' do
        set_home_listing
        #redirects destroy instance variables!!!
        erb :'/home_listings/show'
    end

    # *********PROBLEMS**********
    #ALSO, I can edit a journal entry to be blank!!
    #remove nav bar if the user is NOT logged in.
    ###make sure users can only see the listings they added !!

    # index route for all home listings
    get '/home_listings' do
        @home_listings = Home.all
        
        erb :'home_listings/index'
    end


    # edit route for a home listing
    get '/home_listings/:id/edit' do
        set_home_listing
        if logged_in?
            if @home_listing.users == current_user
            erb :'/home_listings/edit'
            else
                redirect "users/#{current_user.id}"
            end
        else
            redirect '/'
        end
    end

    patch '/home_listings/:id' do
        # find the home listing
        set_home_listing
        if logged_in?
            if @home_listing.users == current_user
                # update the home listing
                @home_listing.update(home_address: params[:home_address], bedroom: params[:bedroom], bathroom: params[:bathroom], price: params[:price], description: params[:description])
                
                # redirect to the show page of modified listing
                redirect "/home_listings/#{@home_listing.id}"
            else
                redirect "users/#{current_user.id}"
            end
        else
            redirect '/'
        end
    end


    private # private means this helper method can only be used in this     controller
      def set_home_listing
        @home_listing = Home.find(params[:id])
      end

end