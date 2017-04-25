# Chapter 18

module Chapter18
  class Exercise1
    def self.print_libraries
      $:.each do |path|
        next unless File.directory?(path)
        Dir.glob("#{path}/**/*").each do |name|
          puts File.basename(name) if name =~ /\.rb$/i
        end
      end
    end
  end

  class Exercise2
    require 'find'

    def self.du(dir)
      total_size = 0
      Find.find(dir) do |path|
        file_size = File.size(path)
        total_size += file_size if File.file?(path)
        printf("%d %s\n", file_size, path)
      end
      puts "total -> #{total_size}"
    end
  end
end

puts '****************************************'
puts "Chapter 18\n\n"
puts 'exercise 1'
Chapter18::Exercise1.print_libraries
puts
puts 'exercise 2'
Chapter18::Exercise2.du(Dir.pwd)
puts '****************************************'

# Chapter 19

module Chapter19
  class Exercise1
    def self.to_utf8(str_euc, str_sjis)
      str_utf8 = str_euc.encode('UTF-8') + str_sjis.encode('UTF-8')
      p str_utf8
      p str_utf8.encoding
    end
  end

  class Exercise2
    def self.to_utf8(file)
      File.open(file, 'r:UTF-8') do |f|
        p f.read
        p f.read.encoding
      end
    end
  end

  class Exercise3
    def self.find_encoding_diff(str)
      p str.encode('Shift_JIS') == str.encode('Windows-31J')
    end
  end
end

puts '****************************************'
puts "Chapter 19\n\n"
puts 'exercise 1'
Chapter19::Exercise1.to_utf8('euc'.encode('EUC-JP'), 'シフジス'.encode('Shift_JIS'))
puts 'exercise 2'
File.open('./Chapter_19.txt', 'w+:Shift_JIS') { |f| f.write('こんにちは') }
Chapter19::Exercise2.to_utf8('./Chapter_19.txt')
puts 'exercise 3'
Chapter19::Exercise3.find_encoding_diff('あ')
puts '****************************************'
