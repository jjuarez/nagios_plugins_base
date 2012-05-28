require 'helpers/helper'
require 'helpers/nagios_response_helper'
require 'nagios/config'


class TestNagiosConfig < Test::Unit::TestCase
  
  context "A Config settings" do
    
    should "instanciate a property in a block" do
      
      Nagios::Config.configure { |config| config.a = "a" }
      
      assert Nagios::Config.a   == "a"
      assert Nagios::Config[:a] == "a"
    end
        
    should "instanciate a property directly" do

      Nagios::Config.b = "b"
      
      assert Nagios::Config[:b] == "b"
      assert Nagios::Config.b   == "b"
    end    
  end
end