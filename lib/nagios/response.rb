require 'nagios/nagios'


module Nagios

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
      
      self
    end
    
    def to_s
      
      pds  = "|#{@label}=#{@value}#{@uom}"
      pds << ";#{@warning};#{@critical}" if @warning && @critical
      pds << ";#{@min};#{@max}" if @min && @max
      pds
    end
  end


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