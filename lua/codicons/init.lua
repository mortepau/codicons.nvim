local codicons = require('codicons.table')

local M = {}

---@alias codiconRetvalKey "'FULL'" | "'ICON'" | "'NAME'" | "'UNICODE'"
---@alias codiconRetval "'full'" | "'icon'" | "'name'" | "'unicode'"

---@alias pattern string

---@class range
---@field 1 integer
---@field 2 integer

---@alias pattern_range pattern | range

---@alias codiconUserConfig table<codiconConfigIdentifier, codiconConfigIdentifier>

---@alias codiconValue codiconConfigIdentifier | codiconConfig

---@alias codiconValueTable table<codiconConfigIdentifier, codiconValue>

--- Table of allowed return values
---@type table<codiconRetvalKey, codiconRetval>
local retvals = {
  FULL = 'full', -- Full configuration
  ICON = 'icon', -- Literal codicon icon
  NAME = 'name', -- String identifier of codicon
  UNICODE = 'unicode', -- Unicode value of codicon
}

--- Validate the return value
---@param retval codiconRetval|nil @The return value to validate
---@param id_type type @The type of the identifier used in the public API
---@return codiconRetval @The validated return value
local function validate_retval(retval, id_type)
  -- Default to icon
  if not retval then
    return retvals.ICON
  end

  -- Assert that retval is valid
  assert(vim.tbl_contains(vim.tbl_values(retvals), retval), '[Codicons.nvim] Invalid retval')

  -- Assert that the combination of identifier and retval is valid
  assert(not (retval == retvals.NAME and id_type == 'string'), '[Codicons.nvim] Invalid combination, retval cannot be name while identifier is a string')
  assert(not (retval == retvals.UNICODE and id_type == 'number'), '[Codicons.nvim] Invalid combination, retval cannot be unicode while identifier is a number')
  assert(not (retval == retvals.UNICODE and id_type == 'table'), '[Codicons.nvim] Invalid combination, retval cannot be unicode while identifier is a range')

  -- The retval is valid, so return it
  return retval
end

--- Filter the table of codicons by a regex pattern
---@param pattern string @The pattern to filter by
---@return codiconConfigTable @The filtered table of codicon configurations
local function filter_by_pattern(pattern)
  local matches = {}
  local regex = vim.regex(pattern)
  for identifier, config in pairs(codicons) do
    if regex:match_str(identifier) then
      matches[identifier] = config
    end
  end

  return matches
end

--- Filter the table of codicons by a range of integers.
---@param range range @The range to filter by
---@return codiconConfigTable @The filtered table of codicon configurations
local function filter_by_range(range)
  local matches = {}
  for index = range[1], range[2] do
    matches[index] = codicons[index]
  end

  return matches
end

--- Override the configuration of an existing codicon
---@param identifier string @A codicon name
---@param unicode integer @The unicode value of a codicon
---@param icon string @The literal codicon icon
---@return nil
local function override_codicon(identifier, unicode, icon)
  -- Remove the entry at the index given by the unicode value of name.
  -- This is done in case the the icon is given a new unicode value
  if codicons[identifier] then
    codicons[codicons[identifier].unicode] = nil
  end
  -- Create entry by name
  codicons[identifier] = {
    unicode = unicode,
    icon = icon
  }
  -- Create entry by unicode value
  codicons[unicode] = {
    name = identifier,
    icon = icon
  }
end

--- Setup the internal state of the codicon library
---@param override codiconUserConfig @Map of codicons to override
---@return nil
function M.setup(override)
  if not override then
    return
  end

  for identifier, value in pairs(override) do
    if type(identifier) == 'number' then
      -- Indexing by the unicode value
      override_codicon(value, identifier, vim.fn.nr2char(identifier))
    else
      if type(value) == 'number' then
        -- Value is given as a numerical value
        override_codicon(identifier, value, vim.fn.nr2char(value))
      else
        -- Value is given as the icon itself
        override_codicon(identifier, vim.fn.char2nr(value), value)
      end
    end
  end
end

--- Get a codicon by identifier
---@param identifier codiconConfigIdentifier @The identifier to find codicon by
---@param retval codiconRetval @The return value
---@return nil | codiconValue @The found codicon value or nil if not found
function M.get(identifier, retval)
  -- Validate retval
  retval = validate_retval(retval, type(identifier))

  if not codicons[identifier] then
    return
  end

  if retval == retvals.FULL then
    return codicons[identifier]
  else
    return codicons[identifier][retval]
  end
end

--- Get a table of codicons matching pattern_range
---@param pattern_range pattern_range @The query parameter
---@param retval codiconRetval @The return value
---@return codiconValueTable @Table of codicon configurations matching the query
function M.query(pattern_range, retval)
  -- Validate retval
  retval = validate_retval(retval, type(pattern_range))

  local matches = {}
  if type(pattern_range) == 'table' then
    assert(#pattern_range == 2, '[Codicons.nvim] Range must be on the form {min, max}')
    matches = filter_by_range(pattern_range)
  else
    matches = filter_by_pattern(pattern_range)
  end

  if retval == retvals.FULL then
    return matches
  else
    return vim.tbl_map(
      function(v)
        return v[retval]
      end,
      matches
    )
  end
end

return M
