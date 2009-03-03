# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{bind}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["TJ Holowaychuk"]
  s.date = %q{2009-03-03}
  s.default_executable = %q{bind}
  s.description = %q{bind actions to filesystem events}
  s.email = %q{tj@vision-media.ca}
  s.executables = ["bind"]
  s.extra_rdoc_files = ["bin/bind", "lib/bind/actions.rb", "lib/bind/listener.rb", "lib/bind/version.rb", "lib/bind.rb", "README.rdoc", "tasks/docs.rake", "tasks/gemspec.rake", "tasks/release.rake", "tasks/spec.rake", "bind.gemspec"]
  s.files = ["bin/bind", "History.rdoc", "lib/bind/actions.rb", "lib/bind/listener.rb", "lib/bind/version.rb", "lib/bind.rb", "Manifest", "Rakefile", "README.rdoc", "spec/bind_action_spec.rb", "spec/bind_listener_spec.rb", "spec/bind_spec.rb", "spec/spec_helper.rb", "tasks/docs.rake", "tasks/gemspec.rake", "tasks/release.rake", "tasks/spec.rake", "Todo.rdoc", "bind.gemspec"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/visionmedia/bind}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Bind", "--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{bind}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{bind actions to filesystem events}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<visionmedia-commander>, [">= 2.4.6"])
    else
      s.add_dependency(%q<visionmedia-commander>, [">= 2.4.6"])
    end
  else
    s.add_dependency(%q<visionmedia-commander>, [">= 2.4.6"])
  end
end
