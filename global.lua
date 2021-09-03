Database = {
  connection = ""
}

function Database:Connect(database, host, username, password)
  local connection = {}
  setmetatable(connection, {__index = Database})

  connection.connect = Connection("mysql", "dbname=" .. database .. ";host=" .. host, username, password)

  return connection
end
