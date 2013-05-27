require 'rubygems'
require 'rake/extensiontask'

spec = Gem::Specification.load('good.gemspec')

Rake::ExtensionTask.new('libfail', spec)
Rake::ExtensionTask.new('good', spec)