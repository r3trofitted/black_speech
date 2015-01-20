# encoding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'black_speech/version'

Gem::Specification.new do |s|
  s.name        = "black_speech"
  s.version     = BlackSpeech::VERSION
  s.authors     = ["Ronan Limon Duparcmeur"]
  s.email       = ["ronan@2-45.pm"]
  s.homepage    = "https://github.com/r3trofitted/black_speech"
  s.summary     = "DSL for WarTroll"
  s.description = "DSL for the WarTroll library"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- spec/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.required_ruby_version = '>= 2.0.0'
  
  s.add_dependency 'rake'

  s.add_development_dependency 'minitest', '>= 5.0.0'
  s.add_development_dependency 'minitest-reporters'
  s.add_development_dependency 'war_troll'
end
