# Chapter 20
require 'date'

module Chapter20
  class Exercise1
    RUBY_BIRTHDAY = Date.new(1993, 2, 24)

    def self.ruby_age(date = Date.today)
      return puts '生まれる前です' if date < RUBY_BIRTHDAY
      p ((date - RUBY_BIRTHDAY) / 365.25).to_i
    end
  end

  class Exercise2
    require 'time'
    def self.jparsedate(jp_date)
      date = Time.strptime(jp_date, '%Y年%m月%d日午後%H時%M分%S秒')
      p date += 43200 if jp_date =~ /午後/
    end
  end

  class Exercise3
    def self.ls_t(dir)
      files = []
      Dir.open(dir) do |d|
        d.each do |file|
          next if file =~ /^\./
          files << file
        end
      end
      sort_by_mtime = files.sort_by { |file| File.mtime(File.join(dir, file)) }
      sort_by_mtime.each { |f| print f + ' ' }
    end
  end

  class Exercise4
    def initialize
      @month_ary = %w[January February March April May June July August September October November December]
      @today = Date.today
      @year = @today.year
      @month = @today.month
      @start_at_month = Date.new(@year, @month, 1)
      @end_of_month = Date.new(@year, @month, -1)
      @day = 1
    end

    def make_calendar
      p @start_at_month.wday
      puts "    #{@month_ary[@month]} #{@year}    "
      puts 'Su Mo Tu We Th Fr Sa'
      @start_at_month.wday.times { print '   ' }
      loop do
        print make_day_str(@day)
        puts if (@start_at_month.wday + @day) % 7 == 0
        break if @day - @end_of_month.day == 0
        @day += 1
      end
    end

    def make_day_str(day)
      return "#{day} ".insert(0, ' ') if "#{day} ".length == 2
      "#{day} "
    end
  end
end

puts '****************************************'
puts "Chapter 20\n\n"
puts 'exercise 1'
Chapter20::Exercise1.ruby_age(Date.new(2013, 2, 23))
Chapter20::Exercise1.ruby_age(Date.new(2013, 2, 24))
Chapter20::Exercise1.ruby_age(Date.new(1800, 2, 23))
puts 'exercise 2'
Chapter20::Exercise2.jparsedate('2015年9月25日午後8時17分50秒')
puts 'exercise 3'
Chapter20::Exercise3.ls_t('./')
puts
puts 'exercise 4'
Chapter20::Exercise4.new.make_calendar
puts
puts '****************************************'
