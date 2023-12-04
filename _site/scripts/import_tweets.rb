require 'fileutils'
require 'json'
require 'pry'
require 'time'

puts "========> Importing tweets <========"

# ---
# layout: status
# date: 2023-08-01 11:56:46
# ---

status_path = "./_status"

puts "Deleting all files"
FileUtils.rm_rf(Dir.glob("#{status_path}/**"), secure: true)

puts "Remaining files:"
puts Dir.entries(status_path)

puts "Loading tweets"

data_hash = JSON.parse(File.read('./scripts/data/tweets.json'))

data_hash.each_with_index do |tweet, i|
  puts "Tweet #{i}"

  text = tweet["tweet"]["full_text"]
  date = Time.parse(tweet["tweet"]["created_at"])
  original_url = "https://twitter.com/marcgg/status/#{tweet["tweet"]["id_str"]}"
  is_reply = (text[0] == "@")

  entities = tweet["tweet"]["entities"]
  media = []
  if entities.any?

    # MEDIA
    if entities["media"]
      entities["media"].each do |medium|
        puts "===> #{medium["media_url_https"]}"
        media << medium["media_url_https"]
        text.gsub!(medium["url"], "")
      end
    end

    # URLS
    if entities["urls"]
      entities["urls"].each do |url|
        text.gsub!(url["url"], "[#{url["display_url"]}](#{url["expanded_url"]})")
      end
    end
  end

  content =  "---\n"
  content += "layout: status\n"
  content += "originalUrl: '#{original_url}'\n"
  content += "isReply: #{is_reply}\n"
  content += "date: #{date.strftime("%Y-%m-%d %H:%M:%S")}\n"
  if media.any?
    content += "media: '#{media.first}'\n"
  end
  content += "---\n\n"
  content += "#{text}\n"

  puts content

  if tweet["tweet"]["id_str"] == "1595875928382799872"
    #binding.pry
  end

  File.write("#{status_path}/#{date.strftime("%Y-%m-%d-%H-%M-%S")}.md", content)
  #raise if i == 200
end

