$:.unshift File.join(File.dirname(__FILE__))


#require 'nagios/nagios_options_parser'
require 'nagios/nagios_config'
require 'nagios/nagios_performance_data'
require 'nagios/nagios_response'
require 'nagios/nagios_monitor'
require 'nagios/nagios_plugin'


module Nagios
  
  OK_CODE        = 0
  WARNING_CODE   = 1
  CRITICAL_CODE  = 2
  UNKNOWN_CODE   = 3
  
  RESPONSE_CODES = {
    
    :ok       =>OK_CODE,
    :warning  =>WARNING_CODE,
    :critical =>CRITICAL_CODE,
    :unknown  =>UNKNOWN_CODE
  }
  
  RESPONSE_CODES.default = UNKNOWN_CODE
  DEFAULT_MESSAGE        = "Ey, you must put a valid message here!"
end
