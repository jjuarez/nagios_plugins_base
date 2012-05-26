# encoding: utf-8
require 'rubygems'
require 'bundler'


begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end


require 'rake'
require 'jeweler'

Jeweler::Tasks.new do |gem|

  gem.name        = "nagios_plugins_base"
  gem.homepage    = "http://github.com/jjuarez/nagios_plugins_base"
  gem.license     = "MIT"
  gem.summary     = %Q{Define a simple Nagios plugin structure}
  gem.description = %Q{Define a simple Nagios basic objects like: Config, PerformanceData, Response, Monitor and Plugin for develop nagios plugins}
  gem.email       = "javier.juarez@gmail.com"
  gem.authors     = ["Javier Juarez"]
end
Jeweler::RubygemsDotOrgTasks.new


require 'rake/testtask'

Rake::TestTask.new(:test) do |test|

  test.libs << 'lib' << 'test'

  test.pattern = 'test/test_*.rb'
  test.verbose = false
end


task :default => :test
