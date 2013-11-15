namespace :travis do
  desc "build"
  task :build do
    puts 'spec running'
    Rake::Task["spec"].invoke
    puts 'cucumber running' 
    Rake::Task["cucumber"].invoke
  end
  desc "db migrate / seed test"
  task :db do
    puts 'rake db:migrate'
    Rake::Task["db:migrate"].invoke
    puts 'rake db:seed'
    Rake::Task["db:seed"].invoke
  end
end
