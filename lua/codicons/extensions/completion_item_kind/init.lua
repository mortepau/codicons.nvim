--[[
Reference for CompletionItemKind codicons
  https://github.com/microsoft/vscode/blob/main/src/vs/editor/common/modes.ts#L400
--]]

local codicons = require('codicons')

local M = {}

M.symbols = {
  Text          = { index = { lsp =  1, vscode = 18 }, icon = 'symbol-key'         }, -- 
  Method        = { index = { lsp =  2, vscode =  0 }, icon = 'symbol-method'      }, -- 
  Function      = { index = { lsp =  3, vscode =  1 }, icon = 'symbol-method'      }, -- 
  Constructor   = { index = { lsp =  4, vscode =  2 }, icon = 'symbol-method'      }, -- 
  Field         = { index = { lsp =  5, vscode =  3 }, icon = 'symbol-field'       }, -- 
  Variable      = { index = { lsp =  6, vscode =  4 }, icon = 'symbol-variable'    }, -- 
  Class         = { index = { lsp =  7, vscode =  5 }, icon = 'symbol-class'       }, -- 
  Interface     = { index = { lsp =  8, vscode =  7 }, icon = 'symbol-interface'   }, -- 
  Module        = { index = { lsp =  9, vscode =  8 }, icon = 'symbol-namespace'   }, -- 
  Property      = { index = { lsp = 10, vscode =  9 }, icon = 'symbol-property'    }, -- 
  Unit          = { index = { lsp = 11, vscode = 12 }, icon = 'symbol-ruler'       }, -- 
  Value         = { index = { lsp = 12, vscode = 13 }, icon = 'symbol-enum'        }, -- 
  Enum          = { index = { lsp = 13, vscode = 15 }, icon = 'symbol-enum'        }, -- 
  Keyword       = { index = { lsp = 14, vscode = 17 }, icon = 'symbol-keyword'     }, -- 
  Snippet       = { index = { lsp = 15, vscode = 27 }, icon = 'symbol-snippet'     }, -- 
  Color         = { index = { lsp = 16, vscode = 19 }, icon = 'symbol-color'       }, -- 
  File          = { index = { lsp = 17, vscode = 20 }, icon = 'symbol-file'        }, -- 
  Reference     = { index = { lsp = 18, vscode = 21 }, icon = 'go-to-file'         }, -- 
  Folder        = { index = { lsp = 19, vscode = 23 }, icon = 'folder'             }, -- 
  EnumMember    = { index = { lsp = 20, vscode = 16 }, icon = 'symbol-enum-member' }, -- 
  Constant      = { index = { lsp = 21, vscode = 14 }, icon = 'symbol-constant'    }, -- 
  Struct        = { index = { lsp = 22, vscode =  6 }, icon = 'symbol-structure'   }, -- 
  Event         = { index = { lsp = 23, vscode = 10 }, icon = 'symbol-event'       }, -- 
  Operator      = { index = { lsp = 24, vscode = 11 }, icon = 'symbol-operator'    }, -- 
  TypeParameter = { index = { lsp = 25, vscode = 24 }, icon = 'symbol-parameter'   }, -- 

  -- Not originally set in vim.lsp.protocol.CompletionItemKind
  CustomColor   = { index = { lsp = 26, vscode = 22 }, icon = 'symbol-color'       }, -- 
  User          = { index = { lsp = 28, vscode = 25 }, icon = 'account'            }, -- 
  Issue         = { index = { lsp = 27, vscode = 26 }, icon = 'issues'             }, -- 
}

--- Set `vim.lsp.protocol.CompletionItemKind`.
--@param opts (table) Table with options defining the behaviour.
--@param opts.include_icon (bool) Include codicon icon in the label in
--  `vim.lsp.protocol.CompletionItemKind`. Default: true.
--@param opts.include_label (bool) Include kind label in the label in
--  `vim.lsp.protocol.CompletionItemKind`. Default: true.
--@param opts.monospaced (bool) Render the icons as monospaced and not include
--  an extra space after the icon.
--@param opts.override (table) Table of icons to override.
function M.set(opts)
  opts = opts or {}

  opts.include_icon = opts.include_icon or opts.include_icon == nil
  opts.include_label = opts.include_label or opts.include_label == nil
  opts.monospaced = opts.monospaced or opts.monospaced == nil
  opts.override = opts.override or {}

  local items = {}
  for label, config in pairs(M.symbols) do
    local icon = opts.override[label] or config.icon
    items[config.index.lsp] = string.format('%s%s%s%s',
      opts.include_icon and codicons.get(icon) or '',
      (not opts.monospaced and opts.include_icon) and ' ' or '', -- Add some spacing if the icon isn't monospaced
      (opts.include_icon and opts.include_label) and ' ' or '', -- Add spacing between icon and label if both are included
      opts.include_label and label or ''
    )
  end

  -- Add reverse lookup, as it is done in the original table, but only do it if
  -- it can be created without errors, i.e. no duplicate indexes
  if opts.include_label then
    vim.tbl_add_reverse_lookup(items)
  end

  if not M.original then
    M.original = vim.lsp.protocol.CompletionItemKind
  end

  vim.lsp.protocol.CompletionItemKind = items
end

--- Reset vim.lsp.protocol.CompletionItemKind to its initial state.
-- If `vim.lsp.protocol.CompletionItemKind` has been modified it will be
-- reverted to its initial state.
function M.reset()
  if M.original then
    vim.lsp.protocol.CompletionItemKind = M.original
    M.original = nil
  end
end

return M
