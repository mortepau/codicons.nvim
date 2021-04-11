local M = {}

-- The base part of the module strings
local base = 'codicons.extensions.'

--- Return a table of all available extensions
---@return table<string, string> @Table of extension name to module name
function M.available()
  return {
    CompletionItemKind = base .. 'completion_item_kind',
    VsCodeProductIcons = base .. 'vs_code_product_icons',
  }
end

return M
