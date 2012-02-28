# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "without_instanciation/version"

Gem::Specification.new do |s|
  s.name        = "without_instanciation"
  s.version     = WithoutInstanciation::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Philippe Cantin"]
  s.email       = ["anoiaque@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Retrieve data with ActiveRecord without objects instanciations}
  s.description = <<-EOF
    On large results of ActiveRecord queries, instanciation + GC of objects has a real cost of
    allocating memory, setting values, and after all GC garbage ...
    Inside a without_instanciation block, data is returned as hash of values.
    Objects instanciation process id skipped and though GC of theses objects too.
    Performance up to 80% for large query result.
    Of course, you no longer work with Ruby AR objects in this block.
    EOF
  
  s.rubyforge_project = "without_instanciation"
  s.add_development_dependency('enginex')
  s.add_development_dependency('sqlite3')
  s.files = Dir['lib/**/*.rb']
  s.require_path = "lib"
  s.test_files  = Dir['test/**/*.rb']
  s.has_rdoc = true
  s.extra_rdoc_files = ["README.rdoc"]
end
