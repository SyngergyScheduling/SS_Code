
task :create do
  db = SQLite3::Database.new "db/development.sqlite3"

  date = Time.now
  username = 'Test01'
  password = BCrypt::Password.create("TestPass1")
  db.execute "insert into referees values (?, ?, ?, ?, ?, ?)", [0, username, password, date.to_s, date.to_s, 1]
  db.close
end
