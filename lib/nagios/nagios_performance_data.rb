module Nagios
  module Core
    
    class PerformanceData

      attr_reader :label, :value, :uom, :warning, :critical, :min, :max
            
      def self.validate_uom(uom)
        ['s', 'us', 'ms', '%', 'B', 'KB', 'MB', 'TB', 'c'].include?(uom)
      end

      def self.validate_range(uom, min, max)

        condition = (min < max)
        condition = condition && (0..100).include?(min) && (0..100).include?(max) if uom == '%'

        condition
      end
      
      def initialize(label, value, options={ })
       
        @label    = label
        @value    = value
        @uom      = PerformanceData.validate_uom(options[:uom]) ? options[:uom] : 'a'        

        @warning  = options[:warning]
        @critical = options[:critical]

        raise ArgumentError.new("Invalid warning or critical values") if @warning && @critical && !PerformanceData.validate_range(@uom, @warning, @critical)

        @min      = options[:min]
        @max      = options[:max]        
                      
        raise ArgumentError.new("Invalid min or max values") if @min && @max && !PerformanceData.validate_range(@uom, @min, @max)
      end

      
      def to_s
        
        pd_str  = "|'#{@label}'=#{@value}[#{@uom}]"
        pd_str << ";[#{@warning}];[#{@critical}]" if @warning && @critical
        pd_str << ";[#{@min}];[#{@max}]" if @min && @max
        
        pd_str
      end
    end
  end
end