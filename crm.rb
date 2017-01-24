require 'sinatra'

get '/' do
  @crm_app_name = "Matt's CRM"
  erb :index
end
