# encoding: utf-8

$:.unshift File.expand_path('../lib', __FILE__)
require 'yp-api/version'

Gem::Specification.new do |s|
  s.name         = "yp-api"
  s.version      = Yp::Api::VERSION
  s.authors      = ["Nik Petersen"]
  s.email        = "demersus@gmail.com"
  s.homepage     = "https://github.com/demersus/yp-api"
  s.summary      = "[TODO: summary]"
  s.description  = "[TODO: description]"

  s.files        = `git ls-files app lib`.split("\n")
  s.platform     = Gem::Platform::RUBY
  s.require_path = 'lib'
  s.rubyforge_project = '[none]'
end
