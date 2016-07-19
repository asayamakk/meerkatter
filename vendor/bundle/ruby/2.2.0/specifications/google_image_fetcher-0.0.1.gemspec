# -*- encoding: utf-8 -*-
# stub: google_image_fetcher 0.0.1 ruby lib

Gem::Specification.new do |s|
  s.name = "google_image_fetcher"
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["ryonext"]
  s.date = "2016-03-02"
  s.email = ["ryonext.s@gmail.com"]
  s.executables = ["google_image"]
  s.files = ["bin/google_image"]
  s.homepage = "https://github.com/ryonext/google_image_fetcher_ruby"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.4.5"
  s.summary = "Fetch images from Google by your search query"

  s.installed_by_version = "2.4.5" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<faraday>, [">= 0"])
      s.add_runtime_dependency(%q<thor>, [">= 0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.11"])
      s.add_development_dependency(%q<faker>, [">= 0"])
      s.add_development_dependency(%q<rake>, ["~> 10.0"])
      s.add_development_dependency(%q<pry-byebug>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
    else
      s.add_dependency(%q<faraday>, [">= 0"])
      s.add_dependency(%q<thor>, [">= 0"])
      s.add_dependency(%q<bundler>, ["~> 1.11"])
      s.add_dependency(%q<faker>, [">= 0"])
      s.add_dependency(%q<rake>, ["~> 10.0"])
      s.add_dependency(%q<pry-byebug>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 0"])
    end
  else
    s.add_dependency(%q<faraday>, [">= 0"])
    s.add_dependency(%q<thor>, [">= 0"])
    s.add_dependency(%q<bundler>, ["~> 1.11"])
    s.add_dependency(%q<faker>, [">= 0"])
    s.add_dependency(%q<rake>, ["~> 10.0"])
    s.add_dependency(%q<pry-byebug>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 0"])
  end
end
