require 'sinatra'
require 'pry'
#\/ specifies that the files are on the 'public' directory, but this is the default already.
set :public_folder, File.dirname(__FILE__) + '/public'



get '/' do
  @tasks= File.readlines('tasks')
  erb :index
end

post '/tasks' do
  #binding.pry
  #this will read the input by the user in the 'post' form \/
  task = params['task_name']
  #this will open the 'tasks' file and write the input content into it. We need to write into a file because
  #if it was merely pushed into an array, the content would get lost after the server was restarted.
  File.open('tasks','a') do |file|
    file.puts(task)
  end

  #this will redirect the user to the initial page instead of redirecting to the '/tasks' page, which does not exist.
  redirect '/'
end


