require_relative 'post.rb'
require_relative 'link.rb'
require_relative 'memo.rb'
require_relative 'task.rb'

puts "Привіт, я твій блокнот!"
puts "Що хочете записати в блокнот?"

сhoices=Post.post_types

choice=-1

until choice>=0 && choice<сhoices.size
  сhoices.each_with_index { |type,index | puts "\t#{index}. #{type}" }
  choice=STDIN.gets.to_i
end

entry=Post.create(choice)

entry.read_from_console
entry.save

puts "Запис збережено!"