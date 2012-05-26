require 'rubygems'
require 'choice'


module Nagios

  Choice.options do
     
    header ''
    header ' Options:'

    option :label, :required =>true do
      short '-l'
      long  '--label'
    end
    
    option :uom, :required =>false do
      short '-u'
      long  '--uom'
      default 'a'
      desc 'Units of measure: { s, ns, ms, B, KB, MB, TB, %, c }'
    end
    
    option :warning,  :required =>true do
      short '-w'
      long  '--warning'
      desc  'Warning threshold value'
    end 

    option :critical, :required =>true do
      short '-c'
      long  '--critical'
      desc  'Critical threshold value'
    end
    
    option :min, :required =>false do
      short '-m'
      long  '--min'
      desc  'Minimun value for performance data'
    end

    option :max, :required =>false do
      short '-M'
      long  '--max'
      desc  'Maximun value for performance data'
    end    

    separator ''
    separator ' help:'

    option :help do
      short '-h'
      long  '--help'
    end

    separator ''
  end
end