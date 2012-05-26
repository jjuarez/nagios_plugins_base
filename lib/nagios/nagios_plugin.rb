module Nagios
  module Plugin
    
    class Base
    
      def initialize(monitor, options={ })
      
        @monitor  = monitor
        @options  = options
        @response = nil
      
        self
      end
    
      def run()
        
        # This operation could be heavy... be careful!
        @monitor.measure
        
        raise StandardError.new("Plugin not implemented!")
      end
    end
  end
end