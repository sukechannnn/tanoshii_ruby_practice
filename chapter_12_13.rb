# Chapter 12

module Chapter12
  class Exercise1
    def self.cels_to_fahr(cels)
      cels.to_f * 9 / 5 + 32
    end
  end

  class Exercise2
    def self.fahr_to_cels(fahr)
      (fahr.to_f - 32) * 5 / 9
    end

    def self.correspondence_table_cels_to_fahr
      1.upto(100) do |cels|
        fahr = Exercise1.cels_to_fahr(cels)
        puts "cels = #{cels.to_f}, fahr = #{fahr}"
      end
    end
  end

  class Exercise3
    def self.dice
      rand(1..6)
    end
  end

  class Exercise4
    def self.dice10
      sum = 0
      10.times do
        sum += Exercise3.dice
      end
      sum
    end
  end

  class Exercise5
    # require 'prime'
    # def self.prime?(num)
    #   Prime.prime?(num)
    # end

    # def self.prime?(num)
    #   return false if num < 2
    #   return true if num == 2
    #   return false if num.even?
    #   i = 3
    #   while i <= num / i
    #     return false if (num % i).zero?
    #     i += 2
    #   end
    #   true
    # end

    def self.prime?(num)
      return false if num < 2
      2.upto(Math.sqrt(num)) do |i|
        if num % i == 0
          return false
        end
      end
      true
    end

    1.upto(10) do |n|
      puts n if prime?(n)
    end
  end
end

puts '****************************************'
puts "Chapter 12\n\n"
puts 'exercise 1'
puts Chapter12::Exercise1.cels_to_fahr(25)
puts 'exercise 2'
# exercise2 = Chapter12::Exercise2
puts Chapter12::Exercise2.fahr_to_cels(77)
Chapter12::Exercise2.correspondence_table_cels_to_fahr
puts 'exercise 3'
puts Chapter12::Exercise3.dice
puts 'exercise 4'
puts Chapter12::Exercise4.dice10
puts 'exercise 5'
puts Chapter12::Exercise5.prime?(7)
puts '****************************************'

# Chapter 13

module Chapter13
  class Exercise1
    def self.create_ary_a
      a = []
      1.upto(100) { |i| a << i }
      a
    end
  end

  class Exercise2
    def self.create_ary_a2
      a = Chapter13::Exercise1.create_ary_a
      a2 = a.map { |i| i * 100 }
      a2
    end

    def self.replace_a_element
      a = Chapter13::Exercise1.create_ary_a
      a.map! { |i| i * 100 }
    end
  end

  class Exercise3
    def self.create_ary_a3
      a = Chapter13::Exercise1.create_ary_a
      a3 = a.select { |i| (i % 3).zero? }
      a3
    end

    def self.delete_multiples_of_3
      a = Chapter13::Exercise1.create_ary_a
      a.reject { |i| !(i % 3).zero? }
    end
  end

  class Exercise4
    def self.reverse_a
      a = Chapter13::Exercise1.create_ary_a
      a.reverse
    end
  end

  class Exercise5
    def self.sum_all_of_a
      a = Chapter13::Exercise1.create_ary_a
      sum_of_a = a.inject(:+)
      sum_of_a
    end
  end

  class Exercise6
    def self.exercise6
      ary = Chapter13::Exercise1.create_ary_a
      result = []
      10.times do |i|
        result << ary[i * 10..(i * 10 + 9)]
      end
      p result
    end
  end

  class Exercise7
    def self.sum_array(ary1, ary2)
      [ary1, ary2].transpose.map { |i| i.inject(:+) }
    end
  end
end

puts '****************************************'
puts "Chapter 13\n\n"
puts 'exercise 1'
p Chapter13::Exercise1.create_ary_a
puts 'exercise 2'
p Chapter13::Exercise2.create_ary_a2
p Chapter13::Exercise2.replace_a_element
puts 'exercise 3'
p Chapter13::Exercise3.create_ary_a3
p Chapter13::Exercise3.delete_multiples_of_3
puts 'exercise 4'
p Chapter13::Exercise4.reverse_a
puts 'exercise 5'
p Chapter13::Exercise5.sum_all_of_a
puts 'exercise 6'
Chapter13::Exercise6.exercise6
puts 'exercise 7'
p Chapter13::Exercise7.sum_array([1, 2, 3], [4, 6, 8])
puts '****************************************'
