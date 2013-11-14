namespace :travis do
  desc "build"
  task :build do
    Rake::Task["db:reset"].invoke
    #Rake::Task["db:seed"].invoke
    Rake::Task["db:test:prepare"].invoke
    Rake::Task["spec"].invoke
    Rake::Task["cucumber"].invoke
  end
end
