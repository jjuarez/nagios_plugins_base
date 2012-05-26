module Nagios

  class Response
    
    def self.return_code(parameters)

      parameters[:message] ||= Nagios::DEFAULT_MESSAGE
      
      $stdout.puts("#{parameters[:message]}#{parameters[:performance_data] if parameters[:performance_data]}")
      Kernel.exit(parameters[:code])
    end
    
    def self.method_missing(method, *arguments)
      
      if [:ok, :warning, :critical, :unknown].include?(method)
       
        send(:return_code, { :code=>Nagios::RESPONSE_CODES[method], :message=>arguments[0], :performance_data=>arguments[1] }) 
      else
        super
      end
    end
  end
end