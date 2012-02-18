require 'spec_helper'

describe Three do

  before(:each) do
    Associator::Association.delete_all
    Two.delete_all
    Three.delete_all
    @foo = Three.create :value => 'foo 3'
    @bar = Two.create :value => 'bar 2'
  end

  it "is valid add" do
    @foo.add_associated(@bar).should be_valid
  end

  it "is valid del" do
    @foo.del_associated(@bar)
    @foo.add_associated(@bar).should be_valid
  end

  it "has associated" do
    @foo.add_associated(@bar)
    f = Three.first
    r = f.two
    r[0].value.should == @bar.value
  end

  it "has not associated now" do
    @foo.add_associated(@bar)
    @foo.del_associated(@bar)
    f = Three.first
    r = f.two
    r.should == []
  end

  it "has not associated" do
    @foo.add_associated(@bar)
    b = Two.first
    r = b.two
    r.should == []
  end
end
