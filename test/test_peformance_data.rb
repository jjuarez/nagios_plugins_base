require 'helpers/helper'
require 'nagios/response'


class TestPerformanceData < Test::Unit::TestCase
  
  context "A Performance Data" do
    
    should "instantiate a minimal Performance Data" do      
      assert Nagios::PerformanceData.new("Label", 256).to_s == "|Label=256a"
    end    

    should "instantiate a minimal Performance Data with an invalid units of measure" do      
      assert Nagios::PerformanceData.new("Label", 256, :oum=>'invalid').to_s == "|Label=256a"
    end    

    should "instantiate a complete Performance Data" do      
      assert Nagios::PerformanceData.new("Label", 256, :uom=>'MB', :warning=>128, :critical=>200, :min=>0, :max=>512).to_s == "|Label=256MB;128;200;0;512"
    end

    should "instantiate a Performance Data with default units of measure" do      
      assert Nagios::PerformanceData.new("Label", 256, :warning=>128, :critical=>200, :min=>0, :max=>512).to_s == "|Label=256a;128;200;0;512"
    end    

    should "instantiate a Performance Data without warning and critical values" do
            
      assert Nagios::PerformanceData.new("Label", 256, :critical=>200, :min=>0, :max=>512).to_s == "|Label=256a;0;512"
      assert Nagios::PerformanceData.new("Label", 256, :warning=>128, :min=>0, :max=>512).to_s == "|Label=256a;0;512"
      assert Nagios::PerformanceData.new("Label", 256, :min=>0, :max=>512).to_s == "|Label=256a;0;512"
    end    

    should "instantiate a Performance Data without min and max values" do
            
      assert Nagios::PerformanceData.new("Label", 256, :warning=>128, :critical=>200, :max=>512).to_s == "|Label=256a;128;200"
      assert Nagios::PerformanceData.new("Label", 256, :warning=>128, :critical=>200, :min=>0).to_s == "|Label=256a;128;200"
      assert Nagios::PerformanceData.new("Label", 256, :warning=>128, :critical=>200).to_s == "|Label=256a;128;200"
    end    

    should "validate bad range for warning and critical values" do
            
      assert_raise ArgumentError do 
        Nagios::PerformanceData.new("Label", 256, :uom=>'MB', :warning=>201, :critical=>200, :min=>0, :max=>512)
      end
      
      assert_raise ArgumentError do 
        Nagios::PerformanceData.new("Label", 256, :uom=>'%',  :warning=>100, :critical=>90, :min=>0, :max=>512) 
      end
      
      assert_raise ArgumentError do 
        Nagios::PerformanceData.new("Label", 256, :uom=>'%',  :warning=>101, :critical=>90, :min=>0, :max=>512)
      end
      
      assert_raise ArgumentError do 
        Nagios::PerformanceData.new("Label", 256, :uom=>'%',  :warning=>90,  :critical=>101, :min=>0, :max=>512)
      end
    end    

    should "validate bad range for min and max values" do
            
      assert_raise ArgumentError do 
        Nagios::PerformanceData.new("Label", 256, :uom=>'MB', :warning=>128, :critical=>200, :min=>512, :max=>0)
      end
      
      assert_raise ArgumentError do 
        Nagios::PerformanceData.new("Label", 256, :uom=>'%',  :warning=>80, :critical=>90, :min=>100, :max=>90)
      end
      
      assert_raise ArgumentError do 
        Nagios::PerformanceData.new("Label", 256, :uom=>'%',  :warning=>80, :critical=>90, :min=>101, :max=>90)
      end
      
      assert_raise ArgumentError do 
        Nagios::PerformanceData.new("Label", 256, :uom=>'%',  :warning=>80, :critical=>90, :min=>90, :max=>101)
      end
    end    
  end
end