require 'sinatra'
require_relative 'contact'
#


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
  contact = Contact.create(
  first_name: params[:first_name],
  last_name: params[:last_name],
  email: params[:email],
  note: params[:note]
  )
  redirect to('/contacts')
end

get '/contacts/:id' do
  @contact = Contact.find(params[:id].to_i)
  if @contact
    erb :show_contact
  else
    raise Sinatra::NotFound
  end
end

get '/contacts/:id/edit' do
  @contact = Contact.find(params[:id].to_i)
  if @contact
    erb :edit_contact
  else
    raise Sinatra.NotFound
  end
end

put '/contacts/:id' do
  @contact = Contact.find(params[:id].to_i)
  if @contact
    @contact = Contact.update(
    @contact.id,
    first_name: params[:first_name],
    last_name: params[:last_name],
    email: params[:email],
    note: params[:note]
    )

    redirect to('/contacts')
  else
    raise Sinatra::NotFound
  end
end

delete '/contacts/:id' do
  @contact = Contact.find(params[:id].to_i)
  if @contact
    @contact.delete
    redirect to('/contacts')
  else
    raise Sinatra::NotFound
  end
end

after do
  ActiveRecord::Base.connection.close
end

# delete '/contacts/:id' do
#   "DELETE request: #{params}"
# end
