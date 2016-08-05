require 'slack-ruby-client'
require 'google_image_fetcher'
require 'logger'
require 'active_support'
require 'active_support/core_ext/object/blank'
require 'active_support/core_ext/object/try'


module GoogleImageFetcher
  class CLI
    def search(query)
      search_url = Fetcher.search_url(query)
      conn = Faraday.new(url: URI.encode(search_url))
      response = conn.get
      result = JSON.parse(response.body)

      result["items"].map {|item| item["link"] }
    end
  end
end


TOKEN = ENV['SLACK_API_TOKEN']
BOT_ATNAME = '<@U0MNHHR8U>'
logger = Logger.new('.log')

Slack.configure do |conf|
  conf.token = TOKEN
end

# RTM Clientのインスタンス生成
client = Slack::RealTime::Client.new

# ユーザからのメッセージを検知したときの処理
client.on :message do |data|
  if data.text.try(:include?, BOT_ATNAME) #メンションを受け取ったとき
    logger.info(Time.now.strftime("recieved at: %H:%M:%S"))
    begin
    message = data.text
    message = message.delete(':').delete(BOT_ATNAME)

    search_word = (rand < 0.95 ? 'ミーアキャット' : 'キツネザル') + message.presence.to_s
    if message.include?('パンダ')
      search_word = message
    elsif message.include?('橋本環奈')
      search_word = message
    elsif ["浴衣", "制服"].any?{|wear| message.include?(wear) }
      search_word = message
    end
    image_list = GoogleImageFetcher::CLI.new.search(search_word)
    image_url = image_list.sample
    logger.info(Time.now.strftime("fetched at:  %H:%M:%S"))

    client.message channel: data.channel, text: image_url
    logger.info(Time.now.strftime("sended at:   %H:%M:%S"))
    rescue => e
      logger.error(sprintf("クラス: %s, メッセージ: %s", e.class, e.message))
    end
  end
end

client.start!