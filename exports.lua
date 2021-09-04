function DBSelect(table, params)
  if not table and not params then
    return false
  end

  return Database:Select(table, params)
end

function DBInsert(table, params)
  if not table and not params then
    return false
  end

  return Database:Insert(table, params)
end

function DBUpdate(table, params)
  if not table and not params then
    return false
  end

  return Database:Update(table, params)
end

function DBDelete(table, params)
  if not table and not params then
    return false
  end

  return Database:Delete(table, params)
end

function DBRaw(query)
  if not query then
    return false
  end

  return Database:Raw(query)
end
