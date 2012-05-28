require 'helpers/helper'
require 'nagios/monitor/base'


class TestNagiosMonitor < Test::Unit::TestCase
  
  context "A Nagios Monitor" do
    
    should "raise an exception" do
      
      assert_raise StandardError do 
        
        Nagios::Monitor::Base.new.measure(:foo=>"bar", :baz=>"blah") 
      end
    end
  end
end