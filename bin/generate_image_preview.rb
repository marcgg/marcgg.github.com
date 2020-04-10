require "RMagick"

puts "generating preview"

EXTENSION = ".gif"

def generate_image(file_name, message)
  puts "Generating image: #{file_name}#{EXTENSION} - #{message}"
  canvas = Magick::ImageList.new
  canvas.new_image(1200, 630)
  canvas.border!(8,8,"#ed5252")

  text = Magick::Draw.new
  text.font = "/Users/marcgg/Dropbox/code/marcgg.github.com/assets/fonts/Open_Sans/OpenSans-ExtraBold.ttf"
  text.pointsize = 105 - message.size
  text.gravity = Magick::CenterGravity

  text.annotate(canvas, 0,0,0,0, message) {
    self.fill = "#1c1c1c"
  }

  canvas.write("../assets/previews/#{file_name}#{EXTENSION}")
end

##################################################################################

FOLDER_PATH = "../_posts/"
MESSAGE_PATTERN = /^socialmediapreview: "([a-zA-Z0-9_ ]*)"$/

Dir.entries(FOLDER_PATH).each do |file|
  next unless file.match?(/\.md$/)
  puts "Processing #{file}"
  file_name = file.to_s.gsub(".md", "")

  file_data = File.read(FOLDER_PATH + file)

  res = file_data.match(MESSAGE_PATTERN)
  if res
    puts "Data found, generating image"
    message = res[1]
    generate_image(file_name, message)
  end
end
