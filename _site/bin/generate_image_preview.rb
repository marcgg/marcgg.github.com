puts "generating preview"

require 'RMagick'

Text = 'How To Find Points Contained in a Polygon Using MySQL'

canvas = Magick::ImageList.new
canvas.new_image(1200, 630) do
  self.background_color = "white"
end

canvas.border!(4,4,"#ed5252")

text = Magick::Draw.new
text.font_family = 'OpenSans'
text.pointsize = 45
text.gravity = Magick::CenterGravity

text.annotate(canvas, 0,0,0,0, Text) {
 self.fill = '#1c1c1c'
}

canvas.write('rubyname.gif')
exit
