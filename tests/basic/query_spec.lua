local eq = assert.are.same
local errors = assert.has_error

describe('query', function()
  local query = require('codicons').query

  local invalid_retval_msg = '[Codicons.nvim] Invalid retval'
  local invalid_pattern_range_msg = '[Codicons.nvim] First parameter must either be a range (table) or a pattern (string)'
  local name_error_msg = '[Codicons.nvim] Invalid combination, retval cannot be name while identifier is a string'
  local range_error_msg = '[Codicons.nvim] Invalid combination, retval cannot be unicode while identifier is a range'
  local malformed_range_error_msg = '[Codicons.nvim] Range must be on the form {min, max}'

  describe('pattern', function()
    it('full matching, single parameter', function()
      eq({ ['comment'] = '' }, query('^comment$'))
    end)

    it('partially matching, single parameter', function()
      local expected = {
        ['comment'] = '',
        ['comment-add'] = '',
        ['comment-discussion'] = ''
      }
      eq(expected, query('comment'))
    end)

    it('partially matching, retval = "unicode"', function()
      local expected = {
        ['comment'] = 60011,
        ['comment-add'] = 60011,
        ['comment-discussion'] = 60103
      }
      eq(expected, query('comment', 'unicode'))
    end)

    it('partially matching, retval = "full"', function()
      local expected = {
        ['comment'] = { unicode = 60011, icon = '' },
        ['comment-add'] = { unicode = 60011, icon = '' },
        ['comment-discussion'] = { unicode = 60103, icon = '' }
      }
      eq(expected, query('comment', 'full'))
    end)
  end)

  describe('range', function()
    it('equal min and max', function()
      eq({ [60011] = '' }, query({0xEA6B, 0xEA6B}))
    end)

    it('increasing range values', function()
      eq({ [60011] = '', [60012] = '', [60013] = '' }, query({0xEA6B, 0xEA6D}))
    end)

    it('partially matching, retval = "unicode"', function()
      local expected = {
        [60011] = { 'comment', 'comment-add' },
        [60012] = { 'warning', 'alert' },
        [60013] = { 'search', 'search-save' }
      }
      eq(expected, query({0xEA6B, 0xEA6D}, 'name'))
    end)

    it('partially matching, retval = "full"', function()
      local expected = {
        [60011] = { name = { 'comment', 'comment-add' }, icon = '' },
        [60012] = { name = { 'warning', 'alert' }, icon = '' },
        [60013] = { name = { 'search', 'search-save' }, icon = '' }
      }
      eq(expected, query({0xEA6B, 0xEA6D}, 'full'))
    end)
  end)

  describe('invalid input', function()
    it('negative range returns empty table', function()
      eq({}, query({60012, 60011}))
    end)

    it('non-matching pattern returns empty table', function()
      eq({}, query('this-does-not-match-anything'))
    end)
  end)

  describe('erronous parameter combination', function()
    it('errors on pattern and name', function()
      errors(function() query('^comment$', 'name') end, name_error_msg)
    end)

    it('errors on hexadecimal range and unicode', function()
      errors(function() query({0xEA6B, 0xEA6C}, 'unicode') end, range_error_msg)
    end)

    it('errors on decimal range and name', function()
      errors(function() query({60011, 60012}, 'unicode') end, range_error_msg)
    end)

    it('errors on malformed range', function()
      errors(function() query({}) end, malformed_range_error_msg)
    end)

    it('errors on invalid pattern_range type', function()
      errors(function() query(true) end, invalid_pattern_range_msg)
    end)

    it('errors on invalid retval', function()
      errors(function() query('some-pattern', 'invalid') end, invalid_retval_msg)
    end)
  end)
end)
