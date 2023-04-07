# Require all the files in the lib directory
Dir["#{Rails.root}/lib/*/*.rb"].each { |file| require file }
