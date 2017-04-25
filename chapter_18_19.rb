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
