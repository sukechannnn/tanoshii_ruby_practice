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
      p date += 43_200 if jp_date =~ /午後/
    end

    # def self.jparsedate(str)
    #   now = Time.now
    #   year = now.year
    #   month = now.month
    #   day = now.day
    #   hour = now.hour
    #   min = now.min
    #   sec = now.sec
    #   str.scan(/(午前|午後)?(\d+)(年|月|日|時|分|秒)/) do
    #     case $3
    #     when "年"
    #       year = $2.to_i
    #     when "月"
    #       month = $2.to_i
    #     when "日"
    #       day = $2.to_i
    #     when "時"
    #       hour = $2.to_i
    #       hour += 12 if $1 == "午後"
    #     when "分"
    #       min = $2.to_i
    #     when "秒"
    #       sec = $2.to_i
    #     end
    #   end
    #   return Time.mktime(year, month, day, hour, min, sec)
    # end
  end

  class Exercise3
    def self.ls_t(dir)
      files = []
      # Dir.open(dir) do |d|
      #   d.each do |file|
      #     next if file =~ /^\./
      #     files << file
      #   end
      # end
      files = Dir.entries(dir).reject { |file| file.start_with?('.') }
      sort_by_mtime = files.sort_by { |file| File.mtime(File.join(dir, file)) }
      # sort_by_mtime.each { |f| print f + ' ' }
      puts sort_by_mtime.join(' ')
    end
  end

  require 'forwardable'
  class Exercise4
    extend Forwardable

    def_delegators :@today, :year, :month

    def initialize
      @month_ary = Date::MONTHNAMES
      @today = Date.today
      @start_at_month = Date.new(year, month, 1)
      @end_of_month = Date.new(year, month, -1)
      @day = 1
    end

    def make_calendar
      p @start_at_month.wday
      puts "    #{@month_ary[month]} #{year}    "
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
      # "#{day} ".length == 2 ? " #{day} " : "#{day} "
      sprintf('%2d ', day)
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
puts 'exercise 4'
Chapter20::Exercise4.new.make_calendar
puts
puts '****************************************'

# Chapter 21

module Chapter21
  class Exercise1
    def self.my_collect(object, &block)
      ary = []
      object.each do |obj|
        ary << block.call(obj)
      end
      ary
    end
  end

  class Exercise2
    def self.exercise2
      to_class = :class.to_proc
      p to_class.call('test')    #=> String
      p to_class.call(123)       #=> Integer
      p to_class.call(2**100)    #=> Integer
    end
  end

  class Exercise3
    def self.accumlator
      total = 0
      proc do |i|
        total += i
      end
    end
  end
end

puts '****************************************'
puts "Chapter 21\n\n"
puts 'exercise 1'
ary = Chapter21::Exercise1.my_collect([1, 2, 3, 4, 5]) do |i|
  i * 2
end
p ary
puts 'exercise 2'
Chapter21::Exercise2.exercise2
puts 'exercise 3'
acc = Chapter21::Exercise3.accumlator
p acc.call(1)
p acc.call(2)
p acc.call(3)
p acc.call(4)
puts '****************************************'
