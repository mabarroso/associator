require 'spec_helper'

describe Two do

  before(:each) do
    @foo = Two.create :value => 'foo'
    @bar = Two.create :value => 'bar'
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
