require 'helper'
require 'nagios_response_helper'
require 'nagios'


class TestPerformanceData < Test::Unit::TestCase
  
  context "A Config settings" do
    
    should "instanciata a property in a block" do
      
      Nagios::Config.configure { |config| config.a = "a" }
      
      assert Nagios::Config.a   == "a"
      assert Nagios::Config[:a] == "a"
    end
        
    should "instanciata a property directly" do

      Nagios::Config.b = "b"
      
      assert Nagios::Config[:b] == "b"
      assert Nagios::Config.b   == "b"
    end    
  end
end