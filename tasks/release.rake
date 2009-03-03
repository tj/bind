
namespace :release do
  
  desc 'Release VERSION. Commits, tags, and pushes.'
  task :version do
    abort 'specify the version x.x.x' unless ENV['VERSION'] and ENV['VERSION'].match(/^\d+\.\d+\.\d+$/)
    `rake manifest`
    `rake gemspec`
    `git commit -a -m '- Release #{ENV['VERSION']}'`
    `git tag #{ENV['VERSION']} && git push && git push --tags`
    puts "Release of #{ENV['VERSION']} complete"
  end
  
end