require 'rubygems'
require 'sinatra'
require 'sqlite3'

db = SQLite3::Database.new "sqlite3.db"
db.execute "create table if not exists numbers ( num integer )"


get '/favorite-number' do
<<HTML
  <form action="favorite-number" method="post" accept-charset="utf-8">
    <label for="number">number</label><input type="text" name="number" value="" id="number" />
    <p><input type="submit" value="Submit"></p>
  </form>
HTML
end


post '/favorite-number' do
  db.execute "insert into numbers (num) values (#{params[:number].to_i})"
  rows = db.execute "select * from numbers"
  "Numbs seen: #{rows.join(' ')}"
end


get '/:name' do
  "Hello, #{params[:name]}"
end