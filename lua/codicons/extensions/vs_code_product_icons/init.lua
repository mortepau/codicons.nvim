---@type codiconConfigTable
local codicons = require('codicons')

---@type vsCodeProductIconConfigTable
local product_icons = require('codicons.extensions.vs_code_product_icons.table')

local M = {}

---@alias vsCodeProductIconRetvalKey codiconRetvalKey | "'DESCRIPTION'"
---@alias vsCodeProductIconRetval codiconRetval | "'description'"

---@alias vsCodeProductIconIdentifier string

---@alias vsCodeProductIconValue string | integer | vsCodeProductIconConfigExtended
---@alias vsCodeProductIconValueTable table<string, vsCodeProductIconValue>

--- Table of valid return values
---@type table<vsCodeProductIconRetvalKey, vsCodeProductIconRetval>
local retvals = {
  FULL = 'full', -- Full configuration
  ICON = 'icon', -- Literal codicon icon
  NAME = 'name', -- String identifier of codicon
  UNICODE = 'unicode', -- Unicode value of codicon
  DESCRIPTION = 'description', -- Product description
}


--- Filter the table of codicons by a regex pattern
---@param pattern string @The pattern to filter by
---@return vsCodeProductIconConfigTable @The filtered table of product configurations
local function filter_by_pattern(pattern)
  local matches = {}
  local regex = vim.regex(pattern)
  for identifier, config in pairs(product_icons) do
    if regex:match_str(identifier) then
      matches[identifier] = config
    end
  end

  return matches
end

--- Validate the return value
---@param retval vsCodeProductIconRetval|nil @The return value to validate
---@return vsCodeProductIconRetval @The validated return value
local function validate_retval(retval)
  if not retval then
    return retvals.ICON
  end

  assert(vim.tbl_contains(vim.tbl_values(retvals), retval), '[Codicons.nvim] Invalid retval')

  return retval
end

--- Return the correct retval from a config table
---@param config vsCodeProductIconConfigExtended @The product configuration
---@param retval vsCodeProductIconRetval @The return value to use
---@return vsCodeProductIconValue @The returned configuration value
local function config_to_retval(config, retval)
  if retval == retvals.FULL then
    return config
  end

  return config[retval]
end

--- Extend the vsCodeProductIconConfig with information from the codicon library
---@param config vsCodeProductIconConfig @The table to extend
---@return vsCodeProductIconConfigExtended @The extended table
local function extend_config(config)
  local codicon_config = codicons.get(config.name, retvals.FULL)
  if codicon_config then
    config.icon = codicon_config.icon
    config.unicode = codicon_config.unicode
  end

  return config
end

--- Get a VS Code Product Icon by identifier
---@param identifier vsCodeProductIconIdentifier @The identifier to get
---@param retval vsCodeProductIconRetval @The return value
---@return vsCodeProductIconValue @The returned value
function M.get(identifier, retval)
  retval = validate_retval(retval)

  if product_icons[identifier] then
    local config = vim.deepcopy(product_icons[identifier])
    config = extend_config(config)

    return config_to_retval(config, retval)
  end
end

--- Get a table of VS Code Product Icons matching pattern
---@param pattern pattern @The query parameter
---@param retval vsCodeProductIconRetval @The return value
---@return vsCodeProductIconValueTable @Table of vsCodeProductIconIdentifier to vsCodeProductIconValue
function M.query(pattern, retval)
  retval = validate_retval(retval)

  local matches = filter_by_pattern(pattern)

  for identifier, config in pairs(matches) do
    matches[identifier] = extend_config(config)
  end

  return vim.tbl_map(
    function(v)
      return config_to_retval(v, retval)
    end,
    matches
  )
end

return M
