require 'spec_helper'

describe Four do

  before(:each) do
    Associator::Association.delete_all
    Four.delete_all
    Five.delete_all
    @foo = Four.create :value => 'foo 4'
    @bar = Five.create :value => 'bar 5'
  end

  it "is valid" do
    @foo.add_associated(@bar).should be_valid
  end

  it "has associated" do
    @foo.add_associated(@bar)
    f = Four.first
    r = f.five
    r[0].value.should == @bar.value
  end

  it "has not associated" do
    @foo.add_associated(@bar)
    b = Five.first
    r = b.four
    r.should == []
  end
end
