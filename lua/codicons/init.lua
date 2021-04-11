local codicons = require('codicons.table')

local M = {}

--- Table of allowed return values
--@field full Return the full codicon configuration
--@field icon Return only the codicon icon
--@field name Return only the codicon name
--@field unicode Return only the codicon unicode hexadecimal value
--@table RetvalType
local RetvalType = {
  full = 'full',
  icon = 'icon',
  name = 'name',
  unicode = 'unicode',
}

--- Validate the retval.
-- Validate the return variable type for `get` and `query`. This is a helper
-- function.
--@param retval (string) the return variable to validate.
--@param id_type (string) the type of the identifier used to index the codicons
--  table.
--@return (string) a valid RetvalType
local function validate_retval(retval, id_type)
  -- Default to icon
  if not retval then
    return RetvalType.icon
  end

  -- Assert that retval is valid
  assert(vim.tbl_contains(vim.tbl_values(RetvalType), retval), '[Codicons.nvim] Invalid retval')

  -- Assert that the combination of identifier and retval is valid
  assert(not (retval == RetvalType.name and id_type == 'string'), '[Codicons.nvim] Invalid combination, retval cannot be name while identifier is a string')
  assert(not (retval == RetvalType.unicode and id_type == 'number'), '[Codicons.nvim] Invalid combination, retval cannot be unicode while identifier is a number')
  assert(not (retval == RetvalType.unicode and id_type == 'table'), '[Codicons.nvim] Invalid combination, retval cannot be unicode while identifier is a range')

  -- The retval is valid, so return it
  return retval
end

--- Filter the table of codicons by a regex pattern.
--@param pattern (string) regex pattern.
--@return (table) table of codicon tables.
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
--@param range (table) table of the min and max value to index with
--@return (table) table of codicon tables.
local function filter_by_range(range)
  local matches = {}
  for index = range[1], range[2] do
    matches[index] = codicons[index]
  end

  return matches
end

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

--- Setup the internal state of the codicon library.
-- @param override (table) Map with codicons to override. Codicon name to icon
--   or hexadecimal unicode value.
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

--- Get a codicon by identifier.
--@param name (string, number) the name or unicode value of the codicon to get.
--@param retval (string) what the returned value should be. Has to be one of
--'table', 'icon', 'name', or 'unicode'.
--@return (nil or match) match is a string if `retval` is 'icon'
--  or 'unicode', or a table if `retval` is 'table'. Nil is returned if no
--  codicon with `name` is found.
function M.get(identifier, retval)
  -- Validate retval
  retval = validate_retval(retval, type(identifier))

  if not codicons[identifier] then
    return
  end

  if retval == RetvalType.full then
    return codicons[identifier]
  else
    return codicons[identifier][retval]
  end
end

--- Get a table of codicons matching query.
--@param pattern_range (string, {number, number}) the regex pattern to match against or range of unicode values.
--@param retval (string) what the returned table should contain. Has to be one of
--  'table', 'icon', 'name', or 'unicode'.
--@return (table) map of matches with codicon name to unicode/icon/complete pairs.
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

  if retval == RetvalType.full then
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
