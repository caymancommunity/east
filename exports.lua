function dbConnect(database, host, username, password)
  if not database and not host and not username and not password then
    return false
  end

  return Database:connect(database, host, username, password)
end

function dbSelect(table, params)
  if not table and not params then
    return false
  end

  return Database:select(table, params)
end

function dbInsert(table, params)
  if not table and not params then
    return false
  end

  return Database:insert(table, params)
end

function dbUpdate(table, params)
  if not table and not params then
    return false
  end

  return Database:update(table, params)
end

function dbDelete(table, params)
  if not table and not params then
    return false
  end

  return Database:delete(table, params)
end

function dbRaw(query)
  if not query then
    return false
  end

  return Database:raw(query)
end
