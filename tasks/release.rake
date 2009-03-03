
namespace :release do
  
  desc 'Release VERSION. Commits, tags, and pushes.'
  task :version do
    abort 'specify the version x.x.x' unless ENV['VERSION'] and ENV['VERSION'].match(/^\d+\.\d+\.\d+$/)
    `git commit -m '- Release #{ENV['VERSION']}'`
    `git tag #{ENV['VERSION']} && git push && git push --tags`
  end
  
end