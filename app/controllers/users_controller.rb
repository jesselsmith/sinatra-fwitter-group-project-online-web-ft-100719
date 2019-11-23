class UsersController < ApplicationController

 get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])

    if !!@user
      erb :'users/show'
    else
      erb :'users/failure'
    end
 end

end
