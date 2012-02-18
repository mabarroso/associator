require 'spec_helper'

describe Two do

  before(:each) do
    Associator::Association.delete_all
    Two.delete_all
    @foo = Two.create :value => 'foo 2'
    @bar = Two.create :value => 'bar 2'
  end

  it "is valid" do
    @foo.add_associated(@bar).should be_valid
  end

  it "has associated" do
    @foo.add_associated(@bar)
    f = Two.first
    r = f.two
    r[0].value.should == @bar.value
  end

  it "has not associated" do
    @foo.add_associated(@bar)
    b = Two.last
    r = b.two
    r.should == []
  end
end
