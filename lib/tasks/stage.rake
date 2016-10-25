
task :stage do
  db = SQLite3::Database.new "db/development.sqlite3"

  date = Time.now
  username = "TestUser"
  password = BCrypt::Password.create("TestPass1")
  db.execute "insert into referees values (?, ?, ?, ?, ?)", [0, username, password, date.to_s, date.to_s]
  db.close
end
