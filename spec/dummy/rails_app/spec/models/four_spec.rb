require 'spec_helper'

describe Four do

  before(:each) do
    Associator::Association.delete_all
    Four.delete_all
    Five.delete_all
    @foo = Four.create :value => 'foo 4'
    @bar = Five.create :value => 'bar 5'
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
    f = Four.first
    r = f.five
    r[0].value.should == @bar.value
  end

  it "has not associated now" do
    @foo.add_associated(@bar)
    @foo.del_associated(@bar)
    f = Four.first
    r = f.five
    r.should == []
  end

  it "has not associated" do
    @foo.add_associated(@bar)
    b = Five.first
    r = b.four
    r.should == []
  end
end
