
time = Time.now.utc

file = File.new("_status/#{time.strftime('%Y-%m-%d-%H-%M-00')}.md", "w")

template =  "---\n"
template += "layout: status\n"
template += "isReply: false\n"
template += "date: #{time.strftime('%Y-%m-%d %H:%M:00')}\n"
template += "---\n\n"

file.write(template)
file.close
