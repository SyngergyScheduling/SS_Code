
task :deploy => :update do
  system 'rails restart'
  system 'rails server -d -b "0.0.0.0"'
  puts 'server started'
end

task :update do
  system 'git checkout master'
  system 'git pull origin master'
  system 'raild db:migrate'
end

task :shutdown do
  pid_file = 'tmp/pids/server.pid'
  if File.exist? pid_file
    puts 'shutting down'
    system "kill $(cat #{pid_file})"
  end
end
