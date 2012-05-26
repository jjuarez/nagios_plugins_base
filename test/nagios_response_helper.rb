module Kernel
  
  alias :old_exit :exit 
  alias :old_puts :puts
  
  def self.exit(code)
    return code
  end
  
  def puts(message)
    return message
  end  
end