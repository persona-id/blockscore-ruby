# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-
# stub: blockscore 2.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "blockscore"
  s.version = "2.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Alain Meier"]
  s.date = "2014-06-15"
  s.description = "A ruby client library for the BlockScore API."
  s.email = "alain@blockscore.com"
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.md"
  ]
  s.files = [
    ".document",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.md",
    "Rakefile",
    "VERSION",
    "blockscore-ruby.sublime-project",
    "blockscore.gemspec",
    "lib/blockscore-cert.crt",
    "lib/blockscore.rb",
    "lib/blockscore/client.rb",
    "lib/blockscore/error/authorization_error.rb",
    "lib/blockscore/error/blockscore_error.rb",
    "lib/blockscore/error/error_handler.rb",
    "lib/blockscore/error/internal_server_error.rb",
    "lib/blockscore/error/not_found_error.rb",
    "lib/blockscore/error/parameter_error.rb",
    "lib/blockscore/error/validation_error.rb",
    "lib/blockscore/errors.rb",
    "lib/blockscore/question_set.rb",
    "lib/blockscore/verification.rb",
    "test/helper.rb",
    "test/test_blockscore.rb"
  ]
  s.homepage = "http://github.com/blockscore/blockscore-ruby"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.2.2"
  s.summary = "A ruby client library for the BlockScore API."

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<httparty>, ["~> 0.13.1"])
      s.add_development_dependency(%q<shoulda>, [">= 0"])
      s.add_development_dependency(%q<rdoc>, ["~> 3.12"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 2.0.1"])
      s.add_development_dependency(%q<simplecov>, [">= 0"])
    else
      s.add_dependency(%q<httparty>, ["~> 0.13.1"])
      s.add_dependency(%q<shoulda>, [">= 0"])
      s.add_dependency(%q<rdoc>, ["~> 3.12"])
      s.add_dependency(%q<bundler>, ["~> 1.0"])
      s.add_dependency(%q<jeweler>, ["~> 2.0.1"])
      s.add_dependency(%q<simplecov>, [">= 0"])
    end
  else
    s.add_dependency(%q<httparty>, ["~> 0.13.1"])
    s.add_dependency(%q<shoulda>, [">= 0"])
    s.add_dependency(%q<rdoc>, ["~> 3.12"])
    s.add_dependency(%q<bundler>, ["~> 1.0"])
    s.add_dependency(%q<jeweler>, ["~> 2.0.1"])
    s.add_dependency(%q<simplecov>, [">= 0"])
  end
end

