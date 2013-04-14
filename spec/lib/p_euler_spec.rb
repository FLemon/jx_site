require 'spec_helper'

describe PEuler do
  describe "#multiples_of_3_and_5" do
    context "below 1000" do
      it "should return 233168" do
        subject.multiples_of_3_and_5.should == 233168
      end
    end
  end

  describe "#even_fibonacci_numbers" do
    context "max term value 89" do
      it "should return 44" do
        subject.even_fibonacci_numbers(89).should == 44
      end
    end
  end
end
