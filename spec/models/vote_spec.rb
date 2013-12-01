require 'spec_helper'

describe Vote do
  it { should validate_presence_of :image_id }
  it { should validate_presence_of :user_id }

  describe "#initialize" do
    it "our vote model totes exists" do
      Vote.new.should be_an_instance_of Vote
    end
  end

end