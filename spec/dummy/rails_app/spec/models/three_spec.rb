require 'spec_helper'

describe Three do

  before(:each) do
    Associator::Association.delete_all
    Two.delete_all
    Three.delete_all
    @foo = Three.create :value => 'foo 3'
    @bar = Two.create :value => 'bar 2'
  end

  it "is valid" do
    @foo.add_associated(@bar).should be_valid
  end

  it "has associated" do
    @foo.add_associated(@bar)
    f = Three.first
    r = f.two
    r[0].value.should == @bar.value
  end

#  it "has not associated" do
#    @foo.add_associated(@bar)
#    b = Two.first
#    r = b.two
#    r.should == []
#  end
end
