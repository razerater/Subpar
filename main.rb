require 'mandrill'
require 'sinatra'

get '/' do
  erb :index  
end

get '/contact' do
  erb :contact
end

get '/mission' do
    erb :mission
end

get '/drivers' do
    erb :drivers
end

msg = Mandrill::API.new

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

m = Mandrill::API.new 

post '/drivers' do
  message = {  
    :subject => "Sübpar Driver Application",  
    :from_name => "Sübpar Headquarters",  
    :text => "Thank you for your interest in becoming a Sübpar driver. Please respond back with work experience and a brief message why you would like to drive for us.",  
    :to => [{:email=> params[:email]}],  
    :html => "Thank you for your interest in becoming a Sübpar driver. Please respond back with work experience and a brief message why you would like to drive for us.",  
    :from_email=>"barack_obama@whitehouse.gov"
  } 
  sending = m.messages.send message 
  puts sending
end
