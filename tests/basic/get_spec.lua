local eq = assert.are.same
local errors = assert.has_error

local function unordered_list_are_same(_, arguments)
  local expected = arguments[1]
  local passed = arguments[2]
  if #expected == #passed then
    for _, evalue in ipairs(expected) do
      local equal = false
      for _, pvalue in ipairs(passed) do
        if evalue == pvalue then equal = true end
      end
      if not equal then return false end
    end
    return true
  end
  return false
end

local say = require('say')
say:set_namespace('en')
say:set('assertion.ul.positive', 'Expected property %s in:\n%s')
say:set('assertion.ul.negative', 'Expected property %s to not be in:\n%s')
assert:register('assertion', 'ul', unordered_list_are_same, 'assertion.ul.positive', 'assertion.ul.negative')
local ul_eq = assert.ul

describe('get', function()
  local get = require('codicons').get

  local invalid_retval_msg = '[Codicons.nvim] Invalid retval'
  local name_error_msg = '[Codicons.nvim] Invalid combination, retval cannot be name while identifier is a string'
  local unicode_error_msg = '[Codicons.nvim] Invalid combination, retval cannot be unicode while identifier is a number'

  describe('single argument', function()
    it('uses identifier', function()
      eq('', get('comment'))
    end)

    it('uses hexadecimal unicode value', function()
      eq('', get(0xEA6B))
    end)

    it('uses decimal unicode value', function()
      eq('', get(60011))
    end)
  end)

  describe('two arguments, retval = "icon"', function()
    it('uses identifier', function()
      eq('', get('comment', 'icon'))
    end)

    it('uses hexadecimal unicode value', function()
      eq('', get(0xEA6B, 'icon'))
    end)

    it('uses decimal unicode value', function()
      eq('', get(60011, 'icon'))
    end)
  end)

  describe('two arguments, retval = "name"', function()
    it('uses hexadecimal unicode value, non-unique value', function()
      ul_eq({ 'comment', 'comment-add' }, get(0xEA6B, 'name'))
    end)

    it('uses decimal unicode value, non-unique value', function()
      ul_eq({ 'comment', 'comment-add' }, get(60011, 'name'))
    end)

    it('uses hexadecimal unicode value, unique value', function()
      eq('cloud', get(0xEBAA, 'name'))
    end)

    it('uses decimal unicode value, unique value', function()
      eq('cloud', get(60330, 'name'))
    end)
  end)

  describe('two arguments, retval = "unicode"', function()
    it('uses identifier', function()
      eq(60011, get('comment', 'unicode'))
    end)
  end)

  describe('two arguments, retval = "full"', function()
    it('uses identifier', function()
      eq({ icon = '', unicode = 60011 }, get('comment', 'full'))
    end)

    it('uses hexadecimal unicode value, unique value', function()
      eq({ icon = '', name = 'cloud' }, get(0xEBAA, 'full'))
    end)

    it('uses decimal unicode value, unique value', function()
      eq({ icon = '', name = 'cloud' }, get(60330, 'full'))
    end)

    it('uses hexadecimal unicode value, non-unique value', function()
      ul_eq({ icon = '', name = { 'comment', 'comment-add' } }, get(0xEA6B, 'full'))
    end)

    it('uses decimal unicode value, non-unique value', function()
      ul_eq({ icon = '', name = { 'comment', 'comment-add' } }, get(60011, 'full'))
    end)
  end)

  describe('invalid input', function()
    it('invalid identifier returns nil', function()
      assert.is.falsy(get('invalid'))
    end)

    it('invalid hexadecimal unicode value returns nil', function()
      assert.is.falsy(get(0x0000))
    end)

    it('invalid decimal unicode value returns nil', function()
      assert.is.falsy(get(0))
    end)
  end)

  describe('erronous parameter combinations', function()
    it('errors when using identifier and retval = "name"', function()
      errors(function() get('comment', 'name') end, name_error_msg)
    end)

    it('errors when using hexadecimal unicode value and retval == "unicode"', function()
      errors(function() get(0xEA6B, 'unicode') end, unicode_error_msg)
    end)

    it('errors when using decimal unicode value and retval == "unicode"', function()
      errors(function() get(60011, 'unicode') end, unicode_error_msg)
    end)

    it('invalid retval', function()
      errors(function() get('comment', 'invalid') end, invalid_retval_msg)
    end)
  end)
end)
