class Three < ActiveRecord::Base
  associated :with => :two
end
