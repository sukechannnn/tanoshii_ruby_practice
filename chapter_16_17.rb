# Chapter 16

module Chapter16
  class Exercise1
    def self.parse_mail(mail)
      # mail.match(/@/)
      # { '$1' => $`, '$2' => $' }
      mail.match(/^([^@]+)@(.*)$/)
      [$1, $2]
    end
  end

  class Exercise2
    def self.defficult_to_easy
      str = '正規表現は難しい！　なんて難しいんだ！'
      str.gsub('難しいんだ', '簡単なんだ').gsub('難しい', '簡単だ')
    end
  end

  class Exercise3
    def self.word_capitalize(word)
      # word.split(/-/).collect{|w| w.capitalize}.join('-')
      word.split(/-/).map(&:capitalize).join('-')
    end
  end
end

puts '****************************************'
puts "Chapter 16\n\n"
puts 'Exercise 1'
p Chapter16::Exercise1.parse_mail('ローカルパート@ドメイン名')
puts 'Exercise 2'
p Chapter16::Exercise2.defficult_to_easy
puts 'Exercise 3'
p Chapter16::Exercise3.word_capitalize('in-reply-to')
p Chapter16::Exercise3.word_capitalize('X-MAILER')
puts '****************************************'

# Chapter 17

module Chapter17
  class Exercise1
    def self.count_linenum(file)
      File.read(file).count("\n")
    end

    def self.count_word(file)
      File.read(file).split(/[\s+[[:blank:]]]/).reject { |w| w.empty? }.size
    end

    def self.count_char(file)
      File.read(file).split('').reject { |w| w.match(/[\s+[[:blank:]]]/) }.size
    end
  end

  class Exercise2
    attr_reader :file

    def initialize(file)
      File.open(file, 'w') { |f| f.puts "たのしい Ruby\nRubyは　たのしい\nRuby is fun.\n" }
      @file = file
    end

    def reverse_line
      # たのしいRuby読まずに説いたコード
      # body = []
      # body = File.read(file).split("\n").reverse
      # open(file, 'w') do |f|
      #   body.each { |b| f.puts b }
      # end

      open(file, 'r+') do |f|
        lines = f.readlines
        f.rewind
        f.truncate(0)
        f.write(lines.reverse.join())
      end
    end

    def delete_except_first_line
      # たのしいRuby読まずに説いたコード
      # word = File.read(file).split("\n").first
      # File.open(file, 'w') { |f| f.puts word }

      open(file, 'r+') do |f|
        lines = f.readlines
        f.rewind
        f.truncate(0)
        f.write(lines[0])
      end
    end

    def delete_except_last_line
      # たのしいRuby読まずに説いたコード
      # word = File.read(file).split("\n").last
      # File.open(file, 'w') { |f| f.puts word }

      open(file, 'r+') do |f|
        lines = f.readlines
        f.rewind
        f.truncate(0)
        f.write(lines.last)
      end
    end
  end

  class Exercise3
    def self.tail(line_num, file)
      contents = File.read(file).split("\n")
      (contents.count - line_num).times { contents.shift }
      contents.each { |content| puts content  }
    end
  end

  class Exercise4
    def self.check_buffering_byte
      writen = 1
      open('./Chapter_17_2_4.txt', 'w') do |f|
        100_000.times do
          f.write('a')
          size = File.size('./Chapter_17_2_4.txt')
          p [writen, size] if writen == size
          writen += 1
        end
      end
    end
  end
end

puts '****************************************'
puts "Chapter 17\n\n"
puts 'Exercise 1'
p Chapter17::Exercise1.count_linenum('./Chapter_17_1.txt')
p Chapter17::Exercise1.count_word('./Chapter_17_1.txt')
p Chapter17::Exercise1.count_char('./Chapter_17_1.txt')
puts 'Exercise 2'
p Chapter17::Exercise2.new('./Chapter_17_2_1.txt').reverse_line
p Chapter17::Exercise2.new('./Chapter_17_2_2.txt').delete_except_first_line
p Chapter17::Exercise2.new('./Chapter_17_2_3.txt').delete_except_last_line
puts 'Exercise 3'
p Chapter17::Exercise3.tail(5, './Chapter_17_3.txt')
puts 'Exercise 4'
p Chapter17::Exercise4.check_buffering_byte
puts '****************************************'
