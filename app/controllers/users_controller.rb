class UsersController < ApplicationController
    # what routes do i need for login?
        #the purpose of this route is to render login page.
    get '/login' do 
        erb :login
    end
        #the purpose of this route is to receive the login form.
        #find the user, and log the user in (create a session)
    post '/login' do
        # params looks like: (email: "user@user.com", password: "password")
        # Find the user
        @user = User.find_by(email: params[:email])
        # Authenticate the user
            # verify the is user is who they say they are
            # they have credentials - email/password combo
        if @user.authenticate(params[:password])
            # log the user in - create the user session
            session[:user_id] = @user.id
                #above line is actually loggin the user in !
            # redirect to the user's show page
            puts session
            redirect "users/#{@user.id}"
        else
            # tell the user they entered invalid credentials
            # redirect them to the login page
        end

    end

    # what routes do i need for signup?
    get '/signup' do
        erb :signup
    end

    post '/users' do
        #here is where we will create a new user and persist the new user to the DB
        # only want to persi
        if params[:name] != "" && params[:email] != "" && params[:password] != "" && params[:phone_number] != "" && params[:base_address] != ""
            # valid input
            @user = User.create(params)
            session[:user_id] = @user.id #actually logging the user in
            redirect "/users/#{@user.id}"
            #redirects to another route!
        else
            #not valid input
            #it would be better to include a message - stretch goal!
            redirect '/signup'
        end
    end

    # user SHOW route
    get '/users/:id' do
        #Do this first
        @user = User.find_by(id: params[:id])

        erb :'/users/show'#erb sends you to a view
    end

    get '/logout' do
        session.clear
        redirect '/'
    end

end