Database = {
  access = nil
}

function Database:Connect(database, host, username, password)
  setmetatable({}, {__index = Database})

  self.access = Connection("mysql", "dbname=" .. database .. ";host=" .. host, username, password)

  return self.access
end

function Database:Insert(tableDb, params)
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
      outputDebugString("Error: " .. send)
      return false
    end
    return true
  end

  return false
end

function Database:Update(tableDb, params)
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
        outputDebugString("Error: " .. send)
        return false
      end
      return true
    end
  end

  return false
end

function Database:Delete(table, params)
  if type(table) == "string" then
    outputDebugString(inspect(self))
  end
end

function Database:Select(table)
end

function Database:Raw(table, query)
end

Database:Connect("ccr_database", "127.0.0.1", "root", "")
--Database:Insert("logs", {log_responsible = 1, log_type = "Car", log_action = "Buy", log_create = "2021-09-03 16:48:40"})

--[[Database:Update(
  "logs",
  {
    params = {log_action = "Sell for users(1)"},
    verify = {log_responsible = 1, log_type = "Car"},
    condition = {"AND", "AND"}
  }
)]]
