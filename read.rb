require_relative 'lib/post.rb'
require_relative 'lib/link.rb'
require_relative 'lib/memo.rb'
require_relative 'lib/task.rb'

require 'optparse'

# Всі наші опції будуть записані сюда
options = Hash.new
# заведемо потрібні нам опції
OptionParser.new do |opt|
  opt.banner = 'Usage: read.rb [options]'

  opt.on('-h', 'Prints this help') do
    puts opt
    exit
  end

  opt.on('--type POST_TYPE', 'какой тип постов показывать (по умолчанию любой)') { |o| options[:type] = o } #
  opt.on('--id POST_ID', 'если задан id — показываем подробно только этот пост') { |o| options[:id] = o } #
  opt.on('--limit NUMBER', 'сколько последних постов показать (по умолчанию все)') { |o| options[:limit] = o } #

end.parse!

result=Post.find(options[:limit], options[:type],options[:id])

if result.is_a? Post
  puts "Запис #{result.class.name} id=#{options[:id]}"

  result.to_strings.each do |line|
    puts line
  end
else
  print "| id\t| @type\t|  @created_at\t\t\t|  @text \t\t\t| @url\t\t| @due_date \t "
result.each do |row|
  puts
  # puts '_'*80
  row.each do |element|
    print "|  #{element.to_s.delete("\\n\\r")[0..40]}\t"
  end
end
end

puts