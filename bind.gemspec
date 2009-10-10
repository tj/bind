# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{bind}
  s.version = "0.2.8"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["TJ Holowaychuk"]
  s.date = %q{2009-10-10}
  s.default_executable = %q{rbind}
  s.description = %q{bind actions to filesystem events}
  s.email = %q{tj@vision-media.ca}
  s.executables = ["rbind"]
  s.extra_rdoc_files = ["README.rdoc", "bin/rbind", "bind.gemspec", "lib/bind.rb", "lib/bind/actions.rb", "lib/bind/actions/refresh_browsers.rb", "lib/bind/command_helpers.rb", "lib/bind/listener.rb", "lib/bind/version.rb", "tasks/docs.rake", "tasks/gemspec.rake", "tasks/release.rake", "tasks/spec.rake"]
  s.files = ["History.rdoc", "Manifest", "README.rdoc", "Rakefile", "Todo.rdoc", "bin/rbind", "bind.gemspec", "examples/demo.html", "examples/globbing.rb", "examples/log_changes.rb", "examples/refresh_browsers.rb", "examples/style.css", "lib/bind.rb", "lib/bind/actions.rb", "lib/bind/actions/refresh_browsers.rb", "lib/bind/command_helpers.rb", "lib/bind/listener.rb", "lib/bind/version.rb", "tasks/docs.rake", "tasks/gemspec.rake", "tasks/release.rake", "tasks/spec.rake"]
  s.homepage = %q{http://github.com/visionmedia/bind}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Bind", "--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{bind}
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{bind actions to filesystem events}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<commander>, [">= 4.0.0"])
    else
      s.add_dependency(%q<commander>, [">= 4.0.0"])
    end
  else
    s.add_dependency(%q<commander>, [">= 4.0.0"])
  end
end
