local eq = assert.are.same

describe('VsCodeProductIcons', function()
  local vcpi

  before_each(function()
    package.loaded['codicons'] = nil
    package.loaded['codicons.table'] = nil
    package.loaded['codicons.extensions'] = nil
    package.loaded['codicons.extensions.vs_code_product_icons'] = nil

    vcpi = require('codicons.extensions.vs_code_product_icons')
  end)

  describe('get', function()
    it('single parameter', function()
      eq('', vcpi.get('accounts-view-bar-icon'))
    end)

    it('two parameters, retval = "name"', function()
      eq('account', vcpi.get('accounts-view-bar-icon', 'name'))
    end)

    it('two parameters, retval = "unicode"', function()
      eq(60313, vcpi.get('accounts-view-bar-icon', 'unicode'))
    end)

    it('two parameters, retval = "description"', function()
      local expected = [[Accounts icon in the view bar.]]
      eq(expected, vcpi.get('accounts-view-bar-icon', 'description'))
    end)

    it('two parameters, retval = "full"', function()
      local expected = {
        icon = '',
        name = 'account',
        unicode = 60313,
        description = [[Accounts icon in the view bar.]],
      }
      eq(expected, vcpi.get('accounts-view-bar-icon', 'full'))
    end)

    it('invalid name returns nil', function()
      assert.is.Nil(vcpi.get('invalid'))
    end)
  end)

  describe('query', function()
    it('returns single result when unique', function()
      eq({ ['accounts-view-bar-icon'] = '' }, vcpi.query('accounts'))
    end)

    it('returns multiple when non-unique', function()
      local expected = {
        ['callhierarchy-incoming'] = '',
        ['callhierarchy-outgoing'] = '',
      }
      eq(expected, vcpi.query('callhier'))
    end)

    it('specifying retval changes returned values', function()
      local expected = {
        ['callhierarchy-incoming'] = 60306,
        ['callhierarchy-outgoing'] = 60307,
      }
      eq(expected, vcpi.query('callhier', 'unicode'))
    end)

    it('invalid query returns empty table', function()
      eq({}, vcpi.query('invalid-and-more-than-that'))
    end)
  end)
end)
