Database = {
  access = nil
}

function Database:connect(database, host, username, password)
  setmetatable({}, {__index = Database})

  self.access = Connection("mysql", "dbname=" .. database .. ";host=" .. host, username, password)

  if self.access then
    outputDebugString("MySql active success!")
    return true
  end

  outputDebugString("MySql active fail!")
  return false
end

function Database:select(tableDb, params)
  local v = {}
  local c = {}

  if type(tableDb) == "string" and type(params) == "table" then
    for index, values in pairs(params) do
      if index == "verify" then
        table.insert(v, values)
      elseif index == "condition" then
        table.insert(c, values)
      end
    end

    local wh = ""
    local par = {}
    for index, values in pairs(v[1]) do
      index = index .. " = ? "

      for i, v in pairs(c[1]) do
        index = index .. v .. " "
        break
      end
      wh = wh .. index
      table.insert(par, values)
    end

    local send = self.access:query("SELECT * FROM " .. tableDb .. " WHERE " .. wh:sub(1, -6), unpack(par)):poll(-1)

    if send then
      return send
    end

    return false
  end

  return false
end

function Database:insert(tableDb, params)
  local d = ""
  local v = {}

  if type(tableDb) == "string" and type(params) == "table" then
    for index, values in pairs(params) do
      index = index .. " = ?, "

      d = d .. index
      table.insert(v, values)
    end

    local send = self.access:exec("INSERT INTO " .. tableDb .. " SET " .. d:sub(1, -3), unpack(v))
    if not send then
      return false
    end
    return true
  end

  return false
end

function Database:update(tableDb, params)
  local p = {}
  local v = {}
  local c = {}

  if type(tableDb) == "string" and type(params) == "table" then
    for index, values in pairs(params) do
      if index == "params" then
        table.insert(p, values)
      elseif index == "verify" then
        table.insert(v, values)
      elseif index == "condition" then
        table.insert(c, values)
      end
    end

    if type(p) == "table" and type(v) == "table" and type(c) == "table" then
      local up = ""
      local wh = ""
      local co = ""
      local par = {}

      for index, values in pairs(p[1]) do
        index = index .. " = ?, "

        up = up .. index
        table.insert(par, values)
      end

      for index, values in pairs(v[1]) do
        index = index .. " = ? "

        for i, v in pairs(c[1]) do
          index = index .. v .. " "
          break
        end
        wh = wh .. index
        table.insert(par, values)
      end

      local send =
        self.access:exec("UPDATE " .. tableDb .. " SET " .. up:sub(1, -3) .. " WHERE " .. wh:sub(1, -6), unpack(par))
      if not send then
        return false
      end
      return true
    end
  end

  return false
end

function Database:delete(tableDb, params)
  local v = {}
  local c = {}

  if type(tableDb) == "string" and type(params) == "table" then
    for index, values in pairs(params) do
      if index == "verify" then
        table.insert(v, values)
      elseif index == "condition" then
        table.insert(c, values)
      end
    end

    local wh = ""
    local par = {}
    for index, values in pairs(v[1]) do
      index = index .. " = ? "

      for i, v in pairs(c[1]) do
        index = index .. v .. " "
        break
      end
      wh = wh .. index
      table.insert(par, values)
    end

    local send = self.access:exec("DELETE FROM " .. tableDb .. " WHERE " .. wh:sub(1, -6), unpack(par))

    if not send then
      return false
    end
    return true
  end

  return false
end

function Database:raw(query)
  if type(query) == "string" then
    local send = self.access:query(tostring(query)):poll(-1)

    if send then
      return send
    end

    return false
  end

  return false
end