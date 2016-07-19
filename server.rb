require 'active_support'
require 'active_support/core_ext/object/blank'
require 'sinatra'

get '/' do
  text = ''
  if File.exist?('./.log')
    IO.foreach('./.log') do |line|
      text << line + '<br>'
    end
  end
  text.presence || "no logs yet"
end