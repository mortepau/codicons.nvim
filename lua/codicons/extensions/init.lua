local M = {}

local base = 'codicons.extensions.'

function M.available()
  return {
    CompletionItemKind = base .. 'completion_item_kind',
    VsCodeIcons = base .. 'vs_code_icons',
  }
end

return M
