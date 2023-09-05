puts "Importing tweets"

# ---
# layout: status
# date: 2023-08-01 11:56:46
# ---

status_path = "status"

FileUtils.rm_rf Dir.glob("#{status_path}/*") if dir_path.present?

