#encoding: utf-8

Gem::Specification.new do |s|
  s.name = "hammertime19"
  s.version = "0.0.5"

  s.authors = ["Kalle Lindstrom"]
  s.date = "2012-08-22"
  s.description = "When this library is required, it replaces the default Ruby exception-raising\nbehavior.  When an error is raised, the developer is presented with a menu\nenabling them to ignore the error, view a stack trace, debug the error using IRB\nor ruby-debug, and more.\n"
  s.email = "lindstrom.kalle@gmail.com"
  s.extra_rdoc_files = [
    "LICENSE",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    "LICENSE",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "example.rb",
    "examples/loaderror.rb",
    "hammertime19.gemspec",
    "lib/hammertime19.rb"
  ]
  s.homepage = "http://github.com/kl/hammertime19"
  s.require_paths = ["lib"]
  s.summary = "Exception debugging console for Ruby"

  s.add_dependency("highline", ["~> 1.5"])
  s.add_dependency("pry", ">= 0.9.10")
  s.add_dependency("binding_of_caller", ">= 0.6.7")

  s.add_development_dependency("rake")
  s.add_development_dependency("minitest")
end
