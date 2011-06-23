# encoding: UTF-8
require 'bundler/gem_tasks'

require 'rake'
require 'rdoc/task'
require 'rake/testtask'

Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = false
end

task :default => :test

Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'DelayedJobAdmin'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README.rdoc')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

desc "Run dummy app for development"
task :dummy do
  cd "test/dummy" do
    sh "rake db:setup"
    sh "rake db:seed"
    sh "rails server"
  end
end