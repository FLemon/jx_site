module PEuler
  def self.multiples_of_3_and_5(number)
    x = 0;
    (1...number).each do |n|
      if n % 3 == 0 || n % 5 == 0
        x = x + n
      end
    end
    x
  end
end
