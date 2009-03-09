# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{bind}
  s.version = "0.2.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["TJ Holowaychuk"]
  s.date = %q{2009-03-09}
  s.default_executable = %q{rbind}
  s.description = %q{bind actions to filesystem events}
  s.email = %q{tj@vision-media.ca}
  s.executables = ["rbind"]
  s.extra_rdoc_files = ["bin/rbind", "bind.gemspec", "lib/bind/actions/refresh_browsers.rb", "lib/bind/actions.rb", "lib/bind/command_helpers.rb", "lib/bind/listener.rb", "lib/bind/version.rb", "lib/bind.rb", "README.rdoc", "tasks/docs.rake", "tasks/gemspec.rake", "tasks/release.rake", "tasks/spec.rake"]
  s.files = ["bin/rbind", "bind.gemspec", "examples/demo.html", "examples/globbing.rb", "examples/log_changes.rb", "examples/refresh_browsers.rb", "examples/style.css", "History.rdoc", "lib/bind/actions/refresh_browsers.rb", "lib/bind/actions.rb", "lib/bind/command_helpers.rb", "lib/bind/listener.rb", "lib/bind/version.rb", "lib/bind.rb", "Manifest", "Rakefile", "README.rdoc", "spec/bind_listener_spec.rb", "spec/fixtures/assets/bar.css", "spec/fixtures/assets/foo.css", "spec/fixtures/assets/jquery.js", "spec/fixtures/assets/js/app.js", "spec/fixtures/assets/js/test.js", "spec/fixtures/style.css", "spec/spec_helper.rb", "tasks/docs.rake", "tasks/gemspec.rake", "tasks/release.rake", "tasks/spec.rake", "test/assets/javascripts/app/foo.js", "test/assets/javascripts/jquery.js", "test/assets/stylesheets/foo.css", "test/assets/stylesheets/style.css", "test/stylesheets/style.sass", "Todo.rdoc"]
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
      s.add_runtime_dependency(%q<visionmedia-commander>, [">= 2.5.6"])
    else
      s.add_dependency(%q<visionmedia-commander>, [">= 2.5.6"])
    end
  else
    s.add_dependency(%q<visionmedia-commander>, [">= 2.5.6"])
  end
end
