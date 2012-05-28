require 'helpers/helper'
require 'helpers/nagios_response_helper'
require 'nagios/response'


class TestNagiosResponse < Test::Unit::TestCase
  
  context "A Nagios Response" do
    
    should "return an Ok with code 0" do
      assert Nagios::Response.ok("Ok") == Nagios::OK_CODE
    end
    
    should "return a Warning with code 1" do
      assert Nagios::Response.warning("Warning") == Nagios::WARNING_CODE
    end
    
    should "return a Critical with code 2" do
      assert Nagios::Response.critical("Critical") == Nagios::CRITICAL_CODE
    end
    
    should "return a Unknown with code 3" do
      assert Nagios::Response.unknown("Unknown") == Nagios::UNKNOWN_CODE
    end
  end
end