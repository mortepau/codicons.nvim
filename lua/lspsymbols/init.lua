--[[
Reference for symbol:
  https://code.visualstudio.com/api/references/icons-in-labels
Reference for unicode value:
  https://github.com/microsoft/vscode-codicons/blob/main/dist/codicon.csv
--]]

local M = {}

-- CompletionItemKind
local completion_item_kind = {
  Text          = {  1, ' ' },
  Method        = {  2, ' ' },
  Function      = {  3, ' ' },
  Constructor   = {  4, ' ' },
  Field         = {  5, ' ' },
  Variable      = {  6, ' ' },
  Class         = {  7, ' ' },
  Interface     = {  8, ' ' },
  Module        = {  9, ' ' },
  Property      = { 10, ' ' },
  Unit          = { 11, ' ' },
  Value         = { 12, ' ' },
  Enum          = { 13, ' ' },
  Keyword       = { 14, ' ' },
  Snippet       = { 15, ' ' },
  Color         = { 16, ' ' },
  File          = { 17, ' ' },
  Reference     = { 18, ' ' },
  Folder        = { 19, ' ' },
  EnumMember    = { 20, ' ' },
  Constant      = { 21, ' ' },
  Struct        = { 22, ' ' },
  Event         = { 23, ' ' },
  Operator      = { 24, ' ' },
  TypeParameter = { 25, ' ' },
}

  -- SymbolKind
-- local symbol_kind = {
--   File          = {  0, '' },
--   Module        = {  1, '' },
--   Namespace     = {  2, '' },
--   Package       = {  3, '' },
--   Class         = {  4, '' },
--   Method        = {  5, '' },
--   Property      = {  6, '' },
--   Field         = {  7, '' },
--   Constructor   = {  8, '' },
--   Enum          = {  9, '' },
--   Interface     = { 10, '' },
--   Function      = { 11, '' },
--   Variable      = { 12, '' },
--   Constant      = { 13, '' },
--   String        = { 14, '' },
--   Number        = { 15, '' },
--   Boolean       = { 16, '' },
--   Array         = { 17, '' },
--   Object        = { 18, '' },
--   Key           = { 19, '' },
--   Null          = { 20, '' },
--   EnumMember    = { 21, '' },
--   Struct        = { 22, '' },
--   Event         = { 23, '' },
--   Operator      = { 24, '' },
--   TypeParameter = { 25, '' },
-- }

function M.setup(opts)
  opts = opts or {}

  local include_kind = opts.include_kind or true
  local include_symbol = opts.include_symbol or true

  if opts.symbols then
    for kind_or_index, unicode in pairs(opts.symbols) do
      if type(kind_or_index) == 'string' then
        -- Simply insert the new unicode at the label
        completion_item_kind[kind_or_index][2] = unicode
      else
        -- Need to find the label matching the index given
        local kind = vim.tbl_filter(function(v) return v[1] == kind_or_index end, completion_item_kind)
        kind = kind[1]
        completion_item_kind[kind][2] = unicode
      end
    end
  end

  local symbols = {}

  for kind, item in pairs(completion_item_kind) do
    local index, unicode = unpack(item)
    symbols[index] = string.format('%s%s%s',
      include_symbol and unicode or '',
      (include_kind and include_symbol) and ' ' or '',
      include_kind and kind or ''
    )
  end

  -- Add reverse indexing for the table
  vim.tbl_add_reverse_lookup(symbols)

  -- Insert the updated CompletionItemKind table
  vim.lsp.protocol.CompletionItemKind = symbols
end

return M
