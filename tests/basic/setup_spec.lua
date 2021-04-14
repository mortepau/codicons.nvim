local eq = assert.are.same

describe('setup', function()
  local codicons
  local default

  before_each(function()
    package.loaded['codicons'] = nil
    package.loaded['codicons.table'] = nil
    codicons = require('codicons')
    default = vim.deepcopy(codicons.query('', 'full'))
    table.sort(default)
  end)

  it('returns default configuration when called without override', function()
    codicons.setup({})

    local actual = codicons.query('', 'full')
    table.sort(actual)

    eq(default, actual)
  end)

  it('overrides when using name/icon mapping', function()
    eq({ icon = '', unicode = 60330 }, codicons.get('cloud', 'full'))
    eq('cloud', codicons.get(60330, 'name'))

    codicons.setup({
      ['cloud'] = ''
    })

    eq({ icon = '', unicode = 60012 }, codicons.get('cloud', 'full'))

    local actual = codicons.get(60012, 'name')
    table.sort(actual)
    eq({ 'alert', 'cloud', 'warning' }, actual)
  end)

  it('overrides when using name/unicode mapping', function()
    eq({ icon = '', unicode = 60330 }, codicons.get('cloud', 'full'))
    eq('cloud', codicons.get(60330, 'name'))

    codicons.setup({
      ['cloud'] = 60012
    })

    eq({ icon = '', unicode = 60012 }, codicons.get('cloud', 'full'))

    local actual = codicons.get(60012, 'name')
    table.sort(actual)
    eq({ 'alert', 'cloud', 'warning' }, actual)
  end)
end)
