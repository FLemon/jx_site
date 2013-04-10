require 'spec_helper'

describe PEuler do
  describe "#multiples_of_3_and_5" do
    context "below 10" do
      it "should return 23" do
        PEuler.multiples_of_3_and_5(10).should == 23
      end
    end
  end
end
