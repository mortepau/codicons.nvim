local M = {}

local base = 'codicons.extensions.'

function M.available()
  return {
    CompletionItemKind = base .. 'completion_item_kind',
    VsCodeProductIcons = base .. 'vs_code_product_icons',
  }
end

return M
