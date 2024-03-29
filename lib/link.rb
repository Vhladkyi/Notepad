class Link<Post
  def initialize
    super
    @url= ''
  end

  def read_from_console
    puts "Адреса ссилки:"
    @url=STDIN.gets.chomp
    puts "Що за ссилка?"
    @text=STDIN.gets.chomp
  end

  def to_strings
    time_string="Створено: #{@created_at.strftime("#{self.class.name}_%Y-%m-%d_%H-%M-%S.txt")} \n\r \n\r"
    return [@url,@text,time_string]
  end

  def to_db_hash
    return super.merge(
        {
            'text'=>@text,
            'url'=>@url
        }
    )
  end

  def load_data(data_hash)
    super(data_hash)
    @url=data_hash['url']
  end
end