
$:.unshift File.expand_path('../lib', __FILE__)
require 'ohai/version'

spec = Gem::Specification.new do |s|
  s.name = "ohai"
  s.version = Ohai::VERSION
  s.platform = RUBY_PLATFORM =~ /java/ ? "java" : Gem::Platform::RUBY
  s.has_rdoc = true
  s.summary = "Ohai profiles your system and emits JSON"
  s.description = s.summary
  s.author = "Adam Jacob"
  s.email = "adam@opscode.com"
  s.homepage = "http://wiki.opscode.com/display/ohai"

  if RUBY_PLATFORM =~ /java/
    s.add_dependency "json"
  else
    s.add_dependency "yajl-ruby"
  end
  s.add_dependency "systemu"
  s.add_dependency "mixlib-cli"
  s.add_dependency "mixlib-config"
  s.add_dependency "mixlib-log"
  s.add_development_dependency "rspec-core"
  s.add_development_dependency "rspec-expectations"
  s.add_development_dependency "rspec-mocks"
  s.bindir = "bin"
  s.executables = %w(ohai)

  s.require_path = 'lib'
  s.files = %w(LICENSE README.rdoc Rakefile) + Dir.glob("{docs,lib,spec}/**/*")
end
