require 'sinatra'

get '/' do
  text = ''
  IO.foreach('./.log') do |line|
    text << line + '<br>'
  end
  text
end