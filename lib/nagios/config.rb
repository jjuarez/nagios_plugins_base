module Nagios
  
  class Config
    
    private
    def self.init
      @settings ||= { }
    end

    public
    def self.method_missing(method, *arguments, &block)

      @settings || init

      case method.to_s
        when /(.+)=$/  then
          pk            = method.to_s.delete('=').to_sym
          @settings[pk] = (arguments.size == 1) ? arguments[0] : arguments

        when /(.+)\?$/ then 
          pk = method.to_s.delete('?').to_sym

          @settings.keys.include?(pk) #true/false
      else

        if @settings.keys.include?(method) # any type
          @settings[method]
        else
          super
        end
      end    
    end

    def self.configure(source=nil, options={ }, &block)

      @settings || init

      options = { :context=>:root }.merge(options)

      case source
        when Hash then @settings.merge!(source)
      else 
        yield self if block_given?
      end

      self
    end
    
    def self.[](key)
      
      @settings || init
      @settings[key.to_sym]
    end

    def self.to_hash 
      @settings || init
    end
    
    def self.to_s
      "#{to_hash.inspect}"
    end
  end    
end