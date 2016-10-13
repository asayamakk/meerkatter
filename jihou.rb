require 'date'
require 'uri'
require 'open-uri'
require 'active_support'
require 'active_support/core_ext/object/to_query'
require 'google_image_fetcher'
require_relative './cli_patch.rb'

exit 0 if Date.today.wday == 0 || Date.today.wday == 6

TOKEN = ENV['SLACK_API_TOKEN']
ROOM_ID = 'C0MMEQ0DN'
deadline = Date.new(2016, 12, 20)
current  = Date.today
rest     = (deadline - current).to_i.to_s
message  = "卒論の提出まであと#{rest}日です。。\n進捗どうですか？"
search_word = '進捗'

image_list = GoogleImageFetcher::CLI.new.search(search_word)
image_url = image_list.sample



def post_to_slack(text)
  params = {
    token: TOKEN,
    channel: ROOM_ID,
    username: 'しんちょくさん',
    icon_emoji: ':keyaki-hirate:',
    text: text
  }
  uri = URI('https://slack.com/api/chat.postMessage')
  uri.query = params.to_query
  open(uri.to_s)
end

post_to_slack(message)
post_to_slack(image_url)
