module Nagios
  module Monitor
    
    class Base

      def initialize(options={ }, &block)
        
        @value = nil
        
        self
      end
      
      def measure(options={ }, &block)
        raise StandardError.new("Not implemented")
      end
    end
  end
end