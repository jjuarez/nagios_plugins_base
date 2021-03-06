require 'helpers/helper'
require 'nagios/monitor/base'
require 'nagios/plugin/base'


class TestNagiosPlugin < Test::Unit::TestCase
  
  context "A Nagios Plugin" do
    
    should "raise an exception" do
      
      assert_raise StandardError do 
        Nagios::Plugin::Base.new(Nagios::Monitor::Base.new()).run() 
      end
    end
  end
end