# Ruby code for map.rb
require "rubygems"
require "json"

ARGF.each do |line|
    line = line.chomp
    record = JSON.parse(line)
    if record.include?('md5')
        puts record['md5'] + "\t" + "0"
    else
        puts record['parentMd5'] + "\t" + line
    end
end
