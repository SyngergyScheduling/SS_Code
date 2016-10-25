
task :create [:arg1, :arg2] do |username, password|
  puts username
  puts password
  #db = SQLite3::Database.new "db/development.sqlite3"

  #date = Time.now
  #username = 
  #password = BCrypt::Password.create("TestPass1")
  #db.execute "insert into referees values (?, ?, ?, ?, ?, ?)", [0, username, password, date.to_s, date.to_s, 0]
  #db.close
end
