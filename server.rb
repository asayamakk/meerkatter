require 'active_support'
require 'active_support/core_ext/object/blank'
require 'sinatra'

configure :production do
end

get '/' do
  text = ''
  if File.exist?('./.log')
    IO.foreach('./.log') do |line|
      text << line + '<br>'
    end
  end
  text.presence || "no logs yet"
end

error do
  'something went wrong... ' + env['sinatra.error'].name
end