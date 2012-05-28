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