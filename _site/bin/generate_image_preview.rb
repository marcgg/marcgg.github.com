require "RMagick"

puts "generating preview"

# https://developers.facebook.com/tools/debug/?q=https%3A%2F%2Fmarcgg.com%2Fblog%2F2020%2F03%2F30%2Fpodcasts-episodes-for-quarantine%2F
# https://www.linkedin.com/post-inspector/inspect/https:%2F%2Fmarcgg.com%2Fblog%2F2020%2F03%2F30%2Fpodcasts-episodes-for-quarantine%2F
# https://cards-dev.twitter.com/validator

EXTENSION = ".jpg"

def generate_image(file_name, message, tag)
  puts "Generating image: #{file_name}#{EXTENSION} - #{message} - #{tag}"

  img = Magick::ImageList.new("./backgrounds/#{tag.downcase}.jpg")
  #img.border!(15,25,"#ed5252")
  txt = Magick::Draw.new
  img.annotate(txt, 0,0,0,0, message) do
    txt.gravity = Magick::CenterGravity
    txt.pointsize = 175 - (message.size*4).to_i
    txt.fill = "#1c1c1c"
    txt.font = "/Users/marcgg/Dropbox/code/marcgg.github.com/assets/fonts/Open_Sans/OpenSans-ExtraBold.ttf"
    img.format = "jpeg"
  end
  img.write("../assets/previews/#{file_name}#{EXTENSION}")
end

##################################################################################

FOLDER_PATH = "../_posts/"
MESSAGE_PATTERN = /^socialmediapreview: "([&a-zA-Z0-9_ !\/\?\.:;=+$%éèà\-']*)"$/
TAG_PATTERN = /^tag: "?([&a-zA-Z0-9_ ]*)"?$/

Dir.entries(FOLDER_PATH).each do |file|
  next unless file.match?(/\.md$/)
  puts "Processing #{file}"
  file_name = file.to_s.gsub(".md", "")

  file_data = File.read(FOLDER_PATH + file)

  res = file_data.match(MESSAGE_PATTERN)
  tag = file_data.match(TAG_PATTERN)
  if res
    puts "Data found, generating image"
    message = res[1]
    generate_image(file_name, message, tag[1])
  else
    puts "Skipping!"
  end
end
