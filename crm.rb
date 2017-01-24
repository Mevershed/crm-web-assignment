require 'sinatra'
require_relative 'contact'
require 'sinatra'

Contact.create('Mark', 'Zuckerberg', 'mark@facebook.com', 'CEO')
Contact.create('Sergey', 'Brin', 'sergey@google.com', 'Co-Founder')
Contact.create('Steve', 'Jobs', 'steve@apple.com', 'Visionary')

get '/' do
  @crm_app_name = "Matt's CRM"
  erb :index
end

get '/contacts' do
  erb :contacts
end

get 'contacts/new' do
  erb :new_contacts
end
