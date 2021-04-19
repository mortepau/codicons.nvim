local eq = assert.are.same

describe('CompletionItemKind', function()
  local default
  local cik
  before_each(function()
    package.loaded['codicons'] = nil
    package.loaded['codicons.table'] = nil
    package.loaded['codicons.extensions'] = nil
    package.loaded['codicons.extensions.completion_item_kind'] = nil

    cik = require('codicons.extensions.completion_item_kind')
    default = vim.deepcopy(vim.lsp.protocol.CompletionItemKind)
    table.sort(default)
  end)

  after_each(function()
    vim.lsp.protocol.CompletionItemKind = default
  end)

  describe('set', function()
    it('set with default params', function()
      cik.set()

      local expected = {
        [1] = ' Text',
        [2] = ' Method',
        [3] = ' Function',
        [4] = ' Constructor',
        [5] = ' Field',
        [6] = ' Variable',
        [7] = ' Class',
        [8] = ' Interface',
        [9] = ' Module',
        [10] = ' Property',
        [11] = ' Unit',
        [12] = ' Value',
        [13] = ' Enum',
        [14] = ' Keyword',
        [15] = ' Snippet',
        [16] = ' Color',
        [17] = ' File',
        [18] = ' Reference',
        [19] = ' Folder',
        [20] = ' EnumMember',
        [21] = ' Constant',
        [22] = ' Struct',
        [23] = ' Event',
        [24] = ' Operator',
        [25] = ' TypeParameter',
        [26] = ' CustomColor',
        [27] = ' Issue',
        [28] = ' User',
      }
      vim.tbl_add_reverse_lookup(expected)

      eq(expected, vim.lsp.protocol.CompletionItemKind)
    end)

    it('set without monospace option', function()
      cik.set({ monospaced = false })

      local expected = {
        [1] = '  Text',
        [2] = '  Method',
        [3] = '  Function',
        [4] = '  Constructor',
        [5] = '  Field',
        [6] = '  Variable',
        [7] = '  Class',
        [8] = '  Interface',
        [9] = '  Module',
        [10] = '  Property',
        [11] = '  Unit',
        [12] = '  Value',
        [13] = '  Enum',
        [14] = '  Keyword',
        [15] = '  Snippet',
        [16] = '  Color',
        [17] = '  File',
        [18] = '  Reference',
        [19] = '  Folder',
        [20] = '  EnumMember',
        [21] = '  Constant',
        [22] = '  Struct',
        [23] = '  Event',
        [24] = '  Operator',
        [25] = '  TypeParameter',
        [26] = '  CustomColor',
        [27] = '  Issue',
        [28] = '  User',
      }
      vim.tbl_add_reverse_lookup(expected)

      eq(expected, vim.lsp.protocol.CompletionItemKind)
    end)

    it('set without icon option', function()
      cik.set({ include_icon = false })

      local expected = {
        [1] = 'Text',
        [2] = 'Method',
        [3] = 'Function',
        [4] = 'Constructor',
        [5] = 'Field',
        [6] = 'Variable',
        [7] = 'Class',
        [8] = 'Interface',
        [9] = 'Module',
        [10] = 'Property',
        [11] = 'Unit',
        [12] = 'Value',
        [13] = 'Enum',
        [14] = 'Keyword',
        [15] = 'Snippet',
        [16] = 'Color',
        [17] = 'File',
        [18] = 'Reference',
        [19] = 'Folder',
        [20] = 'EnumMember',
        [21] = 'Constant',
        [22] = 'Struct',
        [23] = 'Event',
        [24] = 'Operator',
        [25] = 'TypeParameter',
        [26] = 'CustomColor',
        [27] = 'Issue',
        [28] = 'User',
      }
      vim.tbl_add_reverse_lookup(expected)

      eq(expected, vim.lsp.protocol.CompletionItemKind)
    end)

    it('set without label option', function()
      cik.set({ include_label = false })

      local expected = {
        [1] = '',
        [2] = '',
        [3] = '',
        [4] = '',
        [5] = '',
        [6] = '',
        [7] = '',
        [8] = '',
        [9] = '',
        [10] = '',
        [11] = '',
        [12] = '',
        [13] = '',
        [14] = '',
        [15] = '',
        [16] = '',
        [17] = '',
        [18] = '',
        [19] = '',
        [20] = '',
        [21] = '',
        [22] = '',
        [23] = '',
        [24] = '',
        [25] = '',
        [26] = '',
        [27] = '',
        [28] = '',
      }

      eq(expected, vim.lsp.protocol.CompletionItemKind)
    end)

    it('set with overriding icons', function()
      cik.set({ override = { Text = 'debug-breakpoint' } })

      local expected = {
        [1] = ' Text',
        [2] = ' Method',
        [3] = ' Function',
        [4] = ' Constructor',
        [5] = ' Field',
        [6] = ' Variable',
        [7] = ' Class',
        [8] = ' Interface',
        [9] = ' Module',
        [10] = ' Property',
        [11] = ' Unit',
        [12] = ' Value',
        [13] = ' Enum',
        [14] = ' Keyword',
        [15] = ' Snippet',
        [16] = ' Color',
        [17] = ' File',
        [18] = ' Reference',
        [19] = ' Folder',
        [20] = ' EnumMember',
        [21] = ' Constant',
        [22] = ' Struct',
        [23] = ' Event',
        [24] = ' Operator',
        [25] = ' TypeParameter',
        [26] = ' CustomColor',
        [27] = ' Issue',
        [28] = ' User',
      }
      vim.tbl_add_reverse_lookup(expected)

      eq(expected, vim.lsp.protocol.CompletionItemKind)
    end)
  end)

  describe('reset', function()
    it('resets the vim.lsp.protocol.CompletionItemKind table', function()
      cik.set()
      cik.reset()

      eq(vim.lsp.protocol.CompletionItemKind, default)
    end)
  end)
end)
