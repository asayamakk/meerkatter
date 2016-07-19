require 'slack-ruby-client'
require 'google_image_fetcher'
require 'active_support'
require 'active_support/core_ext/object/blank'


TOKEN = ENV['SLACK_API_TOKEN']
BOT_ATNAME = '<@U0MNHHR8U>'

Slack.configure do |conf|
  conf.token = TOKEN
end

# RTM Clientのインスタンス生成
client = Slack::RealTime::Client.new

# slackに接続できたときの処理
# client.on :hello do
#   puts 'connected!'
#   client.message channel: 'your_channel_id', text: 'connected!'
# end

# ユーザからのメッセージを検知したときの処理
client.on :message do |data|
  # puts data
  if data.text.include?(BOT_ATNAME) #メンションを受け取ったとき
    message = data.text
    message = message.delete(':').delete(BOT_ATNAME)

    search_word = (rand < 0.95 ? 'ミーアキャット' : 'キツネザル') + message.presence.to_s
    if message.include?('パンダ')
      search_word = message
    end
    image_list = GoogleImageFetcher::CLI.new.search(search_word)
    image_url = image_list.sample

    client.message channel: data.channel, text: image_url
  end
end

client.start!