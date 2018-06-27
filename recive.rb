require 'bundler'
Bundler.require
require "open-uri"

USER_NAME='@hoge'

Slack.configure do |config|
  config.token = "xoxp-please-legacy-user-token-here"
end

pushed_time=nil
srv = RushButton::Server.new("en0") # ここは各自で
client = Slack::Web::Client.new
user_id = client.users_info(user: USER_NAME).user.id
channel_id = client.im_open(user: user_id).channel.id

srv.add("ma:ad:re:ss:!!:!!") do
  p "time: #{pushed_time}"
  p "now_time: #{Time.now}"
  p "calc_time: #{(Time.now - pushed_time) / 60}" if !pushed_time.nil?
  if pushed_time.nil? || ( (Time.now - pushed_time) / 60 > 90 )
    hoge = client.chat_command(channel: channel_id, command:'/jobcan_touch')
    if hoge.ok?
      TerminalNotifier.notify('打刻しました！(多分)', :open => 'https://hoge.slack.com')
    end
    p "pushed"
    pushed_time = Time.now
  else
    p "no_push"
  end
end
srv.start
