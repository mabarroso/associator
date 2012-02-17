require 'spec_helper'

describe Two do

  before(:each) do
    Associator::Association.delete_all
    Four.delete_all
    Five.delete_all
    @foo = Five.create :value => 'foo 5'
    @bar = Four.create :value => 'bar 4'
  end

  it "is valid" do
    @foo.add_associated(@bar).should be_valid
  end

  it "has associated" do
    @foo.add_associated(@bar)
    f = Five.first
    r = f.four
    r[0].value.should == @bar.value
  end

#  it "has not associated" do
#    @foo.add_associated(@bar)
#    b = Four.last
#    r = b.five
#    r.should == []
#  end
end
