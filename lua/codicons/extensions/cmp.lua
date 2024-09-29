---@class codiconCmpOptions
---@field public keyword_length number
---@field public keyword_pattern string
---@field public get_codicons fun(string): codiconValueTable

---@type codiconCmpOptions
local defaults = {
  -- Number of characters required before querying for codicons
  keyword_length = 3,
  -- Keyword for querying codicons
  keyword_pattern = [[\%([a-z\-]\+\)]],
  -- Function for returning codicons,
  -- must return a table on the form <label, insertText> for nvim-cmp
  get_codicons = function(query)
    return require("codicons").query(query, "icon")
  end,
}

local source = {}

--- Validate the options provided through the nvim-cmp parameters
---@param _ any @The source itself
---@param params any @nvim-cmp parameters
---@return codiconCmpOptions @Table of validated options
source._validate_options = function(_, params)
  local opts = vim.tbl_deep_extend("keep", params.option, defaults)
  vim.validate({
    keyword_length = { opts.keyword_length, "number" },
    keyword_pattern = { opts.keyword_pattern, "string" },
    get_codicons = { opts.get_codicons, "function" },
  })
  return opts
end

--- Get the 'keyword_pattern' value from the cmp options
---@param self any @The source itself
---@param params any @nvim-cmp parameters
---@return string @The keyword pattern
source.get_keyword_pattern = function(self, params)
  local opts = self:_validate_options(params)
  return opts.keyword_pattern
end

--- Completion callback for nvim-cmp, adds items to the - list of completions
---@param self any @The source itself
---@param params any @nvim-cmp parameters
---@param callback any @Function to be called with the gathered completion items
source.complete = function(self, params, callback)
  local opts = self:_validate_options(params)

  local input = string.sub(params.context.cursor_before_line, params.offset)

  -- Add all codicons matching the provided input
  local items = {}
  for symbol, icon in pairs(opts.get_codicons(input)) do
    table.insert(items, {
      label = symbol,
      insertText = icon,
      labelDetails = {
        description = symbol,
      },
      dup = 0,
    })
  end

  callback({
    items = items,
    isIncomplete = false,
  })
end

return  setmetatable({}, { __index = source })
