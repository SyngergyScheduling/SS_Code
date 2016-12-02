
task :create do
  db = SQLite3::Database.new "db/development.sqlite3"

  date = Time.now
  username1 = 'Test01'
  username2 = 'Test02'
  password = BCrypt::Password.create("password1")
  db.execute "insert into referees values (?, ?, ?, ?, ?, ?)", [0, username1, password, Time.now.to_s, Time.now.to_s, 1]
  db.execute "insert into referees values (?, ?, ?, ?, ?, ?)", [1, username2, password, Time.now.to_s, Time.now.to_s, 0]
  db.close
end

task :clearserver do
  puts 'Clearing teams and schedules on server'
  RestClient.get('jointhedockside.duckdns.org:3000/clearteams')
  puts 'done'
end

task :delete_teams_schedules do
  db = SQLite3::Database.new "db/development.sqlite3"
  db.execute('delete from teams;')
  db.execute('delete from schedules;')
end
