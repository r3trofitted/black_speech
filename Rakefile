require "bundler/gem_tasks"

require 'rake/testtask'

Rake::TestTask.new do |t|
  t.name = 'spec'
  t.libs << 'spec'
  t.pattern = 'spec/**/*_spec.rb'
  t.verbose = true
end

task :default => :spec
