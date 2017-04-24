# Chapter 14

module Chapter14
  class Exercise1
    def self.string_to_ary
      'Ruby is an object oriented programming language'.split(' ')
    end
  end

  class Exercise2
    def self.sort_by_alphabet
      ary = Exercise1.string_to_ary
      ary.sort_by { |a| a[0] }
    end
  end

  class Exercise3
    def self.sort_by_alphabet
      ary = Exercise1.string_to_ary
      ary.sort_by { |a| a.downcase[0] }
    end
  end

  class Exercise4
    def self.count_char
      char_ary = 'Ruby is an object oriented programming language'.split('')
      char_hash = char_ary.sort.each_with_object(Hash.new(0)) { |a, hash| hash[a] += 1; }
      char_hash.each { |k, v| print "'#{k}': "; v.times { print '*' }; puts }
    end
  end

  class Exercise5
    KANNUM_1_9 = { '' => 1, '一' => 1, '二' => 2, '三' => 3, '四' => 4, '五' => 5, '六' => 6, '七' => 7, '八' => 8, '九' => 9 }.freeze
    KANNUM_10 = { '千' => 1000, '百' => 100, '十' => 10, '' => 1 }.freeze

    def self.kan2num(kan)
      kan.scan(/([^千百十]*)([千百十]?)/).inject(-1) do |ret, (first_digit, unit)|
        ret + KANNUM_1_9[first_digit] * KANNUM_10[unit]
      end
    end
  end
end

puts '****************************************'
puts "Chapter 14\n\n"
puts 'Exercise 1'
p Chapter14::Exercise1.string_to_ary
puts 'Exercise 2'
p Chapter14::Exercise2.sort_by_alphabet
puts 'Exercise 3'
p Chapter14::Exercise3.sort_by_alphabet
puts 'Exercise 4'
p Chapter14::Exercise4.count_char
puts 'Exercise 5'
p Chapter14::Exercise5.kan2num('七千百二十三')
puts '****************************************'

# Chapter 15

module Chapter15
  class Exercise1
    def self.wday
      { sunday: '日曜日', monday: '月曜日', tuesday: '火曜日', wednesday: '水曜日', thursday: '木曜日', friday: '金曜日', saturday: '土曜日' }
    end
  end

  class Exercise2
    def self.hash_size
      Chapter15::Exercise1.wday.size
    end
  end

  class Exercise3
    def self.exercise3
      Chapter15::Exercise1.wday.each { |k, v| puts "「#{k}」は#{v}のことです。" }
    end
  end

  class Exercise4
    def self.str2hash(str)
      hash = {}
      ary = str.split(/\s+/)
      hash.store(ary.shift, ary.shift) until ary.empty?
      hash
    end
  end
end

puts '****************************************'
puts "Chapter 15\n\n"
puts 'Exercise 1'
p Chapter15::Exercise1.wday
puts 'Exercise 2'
p Chapter15::Exercise2.hash_size
puts 'Exercise 3'
Chapter15::Exercise3.exercise3
puts 'Exercise 4'
p Chapter15::Exercise4.str2hash("blue 青 white 白\nred 赤")
puts '****************************************'
