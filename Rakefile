require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

task :full_release do
  puts `rake release`
  result = `docker build -t girbot .`
  puts result
  hash = result.split('\n').last(2).first.trim.split(' ').last
  puts "Docker hash: #{hash}"
  puts `docker tag #{hash} mess110/girbot:latest`
  puts `docker push mess110/girbot`
end
