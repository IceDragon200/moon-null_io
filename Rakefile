require 'rubocop/rake_task'
require 'yard'
require 'yard/rake/yardoc_task'
require 'rspec'

YARD::Rake::YardocTask.new do |t|
  t.files = ['lib/**/*.rb']
end

RuboCop::RakeTask.new

task doc: :yard
task default: [:rubocop, :doc]
