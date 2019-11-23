class TweetsController < ApplicationController

  get '/tweets' do
    if logged_in?
      @user = current_user
      @tweets = Tweet.all
      erb :'tweets/index'
    else
      redirect '/login'
    end
  end

  get '/tweets/new' do
    if logged_in?
      erb :'tweets/new'
    else
      redirect '/login'
    end
  end

  post '/tweets' do
    redirect '/tweets/new' if params[:content].empty?
    if logged_in?
      tweet = Tweet.new(params)
      tweet.user = current_user
      tweet.save
    end  
    redirect '/tweets'
  end

  get '/tweets/:id' do
    if logged_in?
      @current_user = current_user
      @tweet = Tweet.find_by(id: params[:id])
      erb :'tweets/show'
    else
      redirect '/login'
    end
  end

  get '/tweets/:id/edit' do
    if logged_in?
      @tweet = Tweet.find_by(id: params[:id])
      @current_user = current_user
      erb :'tweets/edit'
    else
      redirect '/login'
    end
  end

  patch '/tweets/:id/edit' do
    if !params[:content].empty?
      tweet = Tweet.find_by(id: params[:id])
      tweet.update(content: params[:content]) 
    end
    redirect "/tweets/#{tweet.id}"
  end

  delete '/tweets/:id' do
    tweet = Tweet.find_by(id: params[:id])
    tweet.delete if tweet.user == current_user
    redirect '/tweets'
  end


end
