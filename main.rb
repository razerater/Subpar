require 'mandrill'
require 'sinatra'

msg = Mandrill::API.new

get '/' do
  erb :index  
end

get '/contact' do
  erb :contact
end

post '/contact' do
  body = {
    :subject => params[:subject],
    :from_name => params[:name],
    :from_email => params[:email],
    :to => [{:name => "Raz Reed", :email => "raz@shipstone.com"}, {:name => "David Toomey", :email => "tud10111@temple.edu"}],
    :html => params[:message],
    :text => params[:message] # fallback if html fails
  }
  
  result = msg.messages.send body
  puts result
end