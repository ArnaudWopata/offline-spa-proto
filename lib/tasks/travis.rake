task :travis do
  [
    'rspec spec --profile --color'
  ].each do |cmd|
    puts "Running #{cmd}..."
    system("bundle exec #{cmd}")
    raise "#{cmd} failed!" unless $?.exitstatus == 0
  end
end
