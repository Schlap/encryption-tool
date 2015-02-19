require 'sinatra'
require 'gibberish'

env = ENV["RACK_ENV"] || 'development'
set :public_folder, 'public'

get '/' do
  erb :index
end

post '/encrypt' do
  message = params[:message].to_s
  key = params[:key].to_s
  cipher = Gibberish::AES.new(key)
  @encrypted_value = cipher.encrypt(message)
  erb :index
end

post '/decrypt' do
  encrypted_message = params[:encrypted_message].to_s
  decrypt_key = params[:decrypt_key].to_s
  cipher = Gibberish::AES.new(decrypt_key)
  @decrypted_value = cipher.decrypt(encrypted_message)
  erb :index
end
