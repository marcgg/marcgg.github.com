require "RMagick"

img = Magick::ImageList.new("background.jpg")
txt = Magick::Draw.new
img.annotate(txt, 0,0,0,0, "Hello World") do
  txt.gravity = Magick::CenterGravity
  txt.pointsize = 100
  txt.fill = "#1c1c1c"
  txt.font = "/absolutepath/Font.ttf"
  img.format = "jpeg"
end
img.write("generated.jpg")
