namespace :travis do
  desc "Run build on travis.ci"
  task :build => ['db:migrate', :spec, :cucumber]
end
