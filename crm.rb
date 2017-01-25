require 'sinatra'
require_relative 'contact'
#
Contact.create('Mark', 'Zuckerberg', 'mark@facebook.com', 'CEO')
Contact.create('Sergey', 'Brin', 'sergey@google.com', 'Co-Founder')
Contact.create('Steve', 'Jobs', 'steve@apple.com', 'Visionary')

get '/' do
  @crm_app_name = "Matt's CRM"
  erb :index
end

get '/contacts' do
  @number = Contact.all.count
  erb :contacts
end
#/contacts/new_contact
get '/contacts/new_contact' do
  erb :new_contact
end

post '/contacts' do
  Contact.create(params[:first_name], params[:last_name], params[:email], params[:note])
  redirect to('/contacts')
end
